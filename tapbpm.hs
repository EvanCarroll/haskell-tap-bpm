import System.Posix.Clock
import Control.Monad
import Data.Vector
import Statistics.Sample

getTimeHiRes = do t <- getTime Realtime
                  let hiRes = let secs = fromIntegral $ sec t
                                  nano = (fromIntegral $ nsec t) * 1e-9
                              in secs + nano
                  return hiRes

getBeatLength = do b <- getTimeHiRes
                   getChar
                   e <- getTimeHiRes
                   let t = b - e
                   return (t)

doBeatCapture = do b <- getBeatLength
                   doBeatCapture
                   let f t = do

main = do print "Slam on a key"
          getBeatLength

