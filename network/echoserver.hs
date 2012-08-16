import Control.Monad
import Network
import System.Environment
import System.IO

main :: IO ()
main = echoServer `catch` exHandler

echoServer :: IO ()
echoServer = withSocketsDo $ do
    args <- getArgs
    let listenPort = fromIntegral $ (read (head args) :: Int)
    listenSock <- listenOn $ PortNumber listenPort
    (handle, host, acceptPort) <- accept listenSock
    putStrLn $ "accepted connection from " ++ host ++ ":" ++ (show acceptPort)
    hSetBuffering handle NoBuffering
    forever $ do
        input <- hGetLine handle
        putStrLn $ "received data: " ++ input
        hPutStrLn handle input
        putStrLn $ "rending data: " ++ input

exHandler :: IOError -> IO ()
exHandler e = putStrLn "houston, we have a problem"
