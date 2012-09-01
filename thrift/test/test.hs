import Product_Types
import qualified Data.Set as Set

product1 :: Product
product1 = Product {
    f_Product_name     = Just "Turkish Wrap",
    f_Product_price    = Just 4.5,
    f_Product_currency = Just GBP,
    f_Product_tags     = Just $ Set.fromList ["food", "lunch"]
}

main :: IO ()
main = do
    putStrLn (show product1)
