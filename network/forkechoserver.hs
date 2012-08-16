import Control.Concurrent
import Control.Monad
import Network
import System.Environment
import System.IO

main :: IO ()
main = forkEchoServer `catch` exHandler

forkEchoServer :: IO ()
forkEchoServer = withSocketsDo $ do
    args <- getArgs
    let listenPort = fromIntegral $ (read (head args) :: Int)
    listenSock <- listenOn $ PortNumber listenPort
    handleIncomingConns listenSock

handleIncomingConns :: Socket -> IO ()
handleIncomingConns listenSock = forever $ do
    (handle, host, acceptPort) <- accept listenSock
    putStrLn $ "accepted connection from " ++ host ++ ":" ++ (show acceptPort)
    hSetBuffering handle NoBuffering
    forkIO $ handleSingleConn handle host (show acceptPort)

handleSingleConn :: Handle -> String -> String -> IO ()
handleSingleConn handle host port = do
    let clientInfo = host ++ ":" ++ port
    input <- hGetLine handle
    putStrLn $ "received data from " ++ clientInfo ++ ": " ++ input
    if input == "\r" 
        then do
            putStrLn $ "close connection with " ++ clientInfo
            hClose handle
        else do
            hPutStrLn handle input
            putStr $ "sending data to " ++ clientInfo ++ ": " ++ input
            handleSingleConn handle host port

exHandler :: IOError -> IO ()
exHandler e = putStrLn "Houston, we have a problem."
