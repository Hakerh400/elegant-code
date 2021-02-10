import Data.Maybe
import Control.Exception
import System.Exit
import GHC.IO.Handle
import qualified Foreign.Ptr as Ptr
import qualified Foreign.Marshal.Alloc as Alloc
import qualified Foreign.Marshal.Utils as Utils
import qualified Foreign.Storable as Storable
import qualified System.Process as Proc
import Control.Exception
import Prelude hiding (log)

import Log
import Common

-- test :: Bool
-- test = foldl test' True testCases where
--   test' :: Bool -> String -> Bool
--   test' a b = a && f == b

-- output :: Bool -> String
-- output test = case test of
--   True -> "All tests passed!"
--   False -> "Wrong"

u = undefined
loop = loop

main :: IO ()
main = do
  let procName = "node"
  let procArgs = ["-p", "require('fs').writeFileSync('c:/users/thomas/downloads/test.txt','ok');for(let i=0;i!==5;i++)fs.writeSync(1,String(i));console.log(setTimeout(()=>process.exit1()))"]

  (exitCode, stdout, stderr) <- spawn
    Nothing procName procArgs Nothing

  log("Exit code: " ++ (show exitCode))
  log()
  log("Stdout: " ++ stdout)
  log("Stderr: " ++ stderr)

spawn :: Maybe String -> String -> [String] -> Maybe String ->
  IO (Integer, String, String)
spawn cwdm procName procArgs inputm = do
  (stdinR, stdinW) <- Proc.createPipe
  (stdoutR, stdoutW) <- Proc.createPipe
  (stderrR, stderrW) <- Proc.createPipe

  let procInfo = Proc.CreateProcess {
    Proc.cmdspec = Proc.RawCommand procName procArgs,
    Proc.cwd = cwdm,
    Proc.env = Nothing,
    Proc.std_in = Proc.UseHandle stdinR,
    Proc.std_out = Proc.UseHandle stdoutW,
    Proc.std_err = Proc.UseHandle stderrW,
    Proc.close_fds = True,
    Proc.create_group = False,
    Proc.delegate_ctlc = False,
    Proc.detach_console = False,
    Proc.create_new_console = False,
    Proc.new_session = True,
    Proc.child_group = Nothing,
    Proc.child_user = Nothing,
    Proc.use_process_jobs = False
  }

  ifd inputm (hPutStr stdinW)
  -- hClose stdinW

  (_, _, _, proc) <- Proc.createProcess procInfo

  waitForProcess proc stdoutR stderrR "" ""

waitForProcess :: Proc.ProcessHandle -> Handle -> Handle -> String -> String ->
  IO (Integer, String, String)
waitForProcess proc stdoutR stderrR stdout stderr = do
  stdout <- readByteFromHandle stdoutR stdout
  stderr <- readByteFromHandle stderrR stderr

  exitCodeRawm <- Proc.getProcessExitCode proc

  -- log(exitCodeRawm)

  imte exitCodeRawm (\exitCodeRaw -> do
      let exitCode = exitCode2Int exitCodeRaw

      stdout <- readAllBytesFromHandle stdoutR stdout
      stderr <- readAllBytesFromHandle stderrR stderr

      return (exitCode, reverse stdout, reverse stderr)
    ) (waitForProcess proc stdoutR stderrR stdout stderr)

readAllBytesFromHandle :: Handle -> String -> IO String
readAllBytesFromHandle handle str = do
  eof <- isHandleEof handle

  ite (not eof) (do
      str <- readByteFromHandle handle str
      readAllBytesFromHandle handle str
    ) (pure str)

readByteFromHandle :: Handle -> String -> IO String
readByteFromHandle handle str = do
  ready <- isHandleReady handle

  str <- ite ready (do
      charPtr <- Utils.new '\x00'
      bytesRead <- hGetBufNonBlocking handle charPtr 1
      char <- Storable.peek charPtr
      Alloc.free charPtr

      return $ ite (bytesRead == 1) (char:str) str
    ) (pure str)

  return str

getHandleStatus :: Handle -> IO (Maybe Bool)
getHandleStatus handle = do
  ready <- (catch (do
      ready <- hWaitForInput handle 0
      return $ Just ready
    ) ((\_ -> do
      return Nothing
    )::(IOError -> IO (Maybe Bool))))

  return ready

isHandleReady :: Handle -> IO Bool
isHandleReady handle = do
  status <- getHandleStatus handle
  return $ maybe False id status

isHandleEof :: Handle -> IO Bool
isHandleEof handle = do
  status <- getHandleStatus handle
  return $ maybe True (const False) status

exitCode2Int :: ExitCode -> Integer
exitCode2Int ExitSuccess = 0
exitCode2Int (ExitFailure a) = toInteger a