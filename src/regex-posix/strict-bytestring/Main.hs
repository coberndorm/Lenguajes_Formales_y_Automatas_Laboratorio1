import System.Environment
import Text.Regex.Posix
import qualified Data.ByteString.Char8 as B
import Control.Exception
import Data.Time

-- |Main Function
main :: IO ()
main = do
            args <- getArgs
            txt <- readFile (head args)
            let regex = last args
            start <- getCurrentTime
            print ("Result: " ++ show (checkRegex txt regex :: Bool))
            end <- getCurrentTime
            print ("Time: " ++ show(diffUTCTime end start))

checkRegex :: String -> String -> Bool
checkRegex txt regex =  B.pack txt =~ B.pack regex :: Bool