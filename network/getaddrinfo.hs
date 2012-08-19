import Network.Socket hiding (send, sendTo, recv, recvFrom)
import Network.Socket.ByteString

main = withSocketsDo $ do
    (host:port:_) <- getArgs
    -- Ask for IPv4 and Stream socket.
    let myHints = defaultHints { addrFamily = AF_INET,
                                 addrSocketType = Stream }
    addrInfos <- getAddrInfo (Just myHints) (Just host) (Just port)
    let listenAddr = head addrInfos
    listenSock <- socket (addrFamily listenAddr) 
                         (addrSocketType listenAddr) 
                         defaultProtocol
    bindSocket listenSock (addrAddress listenAddr)
    listen listenSock sOMAXCONN
    (acceptSock, acceptAddr) <- accept listenSock
    sClose acceptSock
    sClose listenSock
