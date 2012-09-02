import ExpensesService
import ExpensesService_Client
import Product_Types

import Network
import Thrift.Protocol.Binary
import Thrift.Transport.Handle

import qualified Data.Set as Set

product1 :: Product
product1 = Product {
    f_Product_name     = Just "Coca Cola",
    f_Product_price    = Just 2,
    f_Product_currency = Just GBP,
    f_Product_tags     = Just $ Set.fromList ["drink", "lunch"]
}

main:: IO ()
main = do
    handle <- hOpen ("localhost", PortNumber 3000)
    result <- addProduct (BinaryProtocol handle, BinaryProtocol handle) product1
    print result
