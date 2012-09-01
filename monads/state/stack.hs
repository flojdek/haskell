import Control.Monad.Identity
import Control.Monad.State

type Stack = [Int]

pop :: StateT Stack Identity Int
pop = StateT $ \(x:xs) -> Identity (x, xs)

push :: Int -> StateT Stack Identity ()
push x = StateT $ \xs -> Identity ((), x:xs)

manip :: StateT Stack Identity ()
manip = do
    push 1
    push 2
    push 3
    top <- pop
    push top

main :: IO ()
main = (putStrLn . show) $ runState manip []
