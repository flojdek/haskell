import ExpensesService
import ExpensesService_Iface

import Product_Types

import Thrift.Server

data ESImpl = ESImpl

instance ExpensesService_Iface ESImpl where
  addProduct ESImpl Nothing        = return 0
  addProduct ESImpl (Just product) = return 1

main = do
    runBasicServer ESImpl process 3000
