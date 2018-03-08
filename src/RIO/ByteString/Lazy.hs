-- | Lazy @ByteString@. Import as:
--
-- > import qualified RIO.ByteString.Lazy as B.Lazy
module RIO.ByteString.Lazy
  (
  -- * The @ByteString@ type
    Data.ByteString.Lazy.ByteString

  -- * Introducing and eliminating 'ByteString's
  , Data.ByteString.Lazy.empty
  , Data.ByteString.Lazy.singleton
  , Data.ByteString.Lazy.pack
  , Data.ByteString.Lazy.unpack
  , Data.ByteString.Lazy.fromStrict
  , Data.ByteString.Lazy.toStrict
  , Data.ByteString.Lazy.fromChunks
  , Data.ByteString.Lazy.toChunks
  , Data.ByteString.Lazy.foldrChunks
  , Data.ByteString.Lazy.foldlChunks

  -- * Basic interface
  , Data.ByteString.Lazy.cons
  , Data.ByteString.Lazy.cons'
  , Data.ByteString.Lazy.snoc
  , Data.ByteString.Lazy.append
  , Data.ByteString.Lazy.uncons
  , Data.ByteString.Lazy.unsnoc
  , Data.ByteString.Lazy.null
  , Data.ByteString.Lazy.length

  -- * Transforming ByteStrings
  , Data.ByteString.Lazy.map
  , Data.ByteString.Lazy.reverse
  , Data.ByteString.Lazy.intersperse
  , Data.ByteString.Lazy.intercalate
  , Data.ByteString.Lazy.transpose

  -- * Reducing 'ByteString's (folds)
  , Data.ByteString.Lazy.foldl
  , Data.ByteString.Lazy.foldl'
  , Data.ByteString.Lazy.foldr

  -- ** Special folds
  , Data.ByteString.Lazy.concat
  , Data.ByteString.Lazy.concatMap
  , Data.ByteString.Lazy.any
  , Data.ByteString.Lazy.all

  -- * Building ByteStrings
  -- ** Scans
  , Data.ByteString.Lazy.scanl

  -- ** Accumulating maps
  , Data.ByteString.Lazy.mapAccumL
  , Data.ByteString.Lazy.mapAccumR

  -- ** Infinite ByteStrings
  , Data.ByteString.Lazy.repeat
  , Data.ByteString.Lazy.replicate
  , Data.ByteString.Lazy.cycle
  , Data.ByteString.Lazy.iterate

  -- ** Unfolding ByteStrings
  , Data.ByteString.Lazy.unfoldr

  -- * Substrings
  -- ** Breaking strings
  , Data.ByteString.Lazy.take
  , Data.ByteString.Lazy.drop
  , Data.ByteString.Lazy.splitAt
  , Data.ByteString.Lazy.takeWhile
  , Data.ByteString.Lazy.dropWhile
  , Data.ByteString.Lazy.span
  , Data.ByteString.Lazy.break
  , Data.ByteString.Lazy.group
  , Data.ByteString.Lazy.groupBy
  , Data.ByteString.Lazy.inits
  , Data.ByteString.Lazy.tails
  , Data.ByteString.Lazy.stripPrefix
  , Data.ByteString.Lazy.stripSuffix

  -- ** Breaking into many substrings
  , Data.ByteString.Lazy.split
  , Data.ByteString.Lazy.splitWith

  -- * Predicates
  , Data.ByteString.Lazy.isPrefixOf
  , Data.ByteString.Lazy.isSuffixOf

  -- * Search ByteStrings
  -- ** Searching by equality
  , Data.ByteString.Lazy.elem
  , Data.ByteString.Lazy.notElem

  -- ** Searching with a predicate
  , Data.ByteString.Lazy.find
  , Data.ByteString.Lazy.filter
  , Data.ByteString.Lazy.partition

  -- * Indexing ByteStrings
  , Data.ByteString.Lazy.index
  , Data.ByteString.Lazy.elemIndex
  , Data.ByteString.Lazy.elemIndexEnd
  , Data.ByteString.Lazy.elemIndices
  , Data.ByteString.Lazy.findIndex
  , Data.ByteString.Lazy.findIndices
  , Data.ByteString.Lazy.count

  -- * Zipping and unzipping ByteStrings
  , Data.ByteString.Lazy.zip
  , Data.ByteString.Lazy.zipWith
  , Data.ByteString.Lazy.unzip

  -- * Low level conversions
  -- ** Copying ByteStrings
  , Data.ByteString.Lazy.copy

  -- * I\/O with 'ByteString's
  -- ** Standard input and output
  , getContents
  , putStr
  , putStrLn
  , interact

  -- ** Files
  , readFile
  , writeFile
  , appendFile

  -- ** I\/O with Handles
  , hGetContents
  , hGet
  , hGetNonBlocking
  , hPut
  , hPutNonBlocking
  , hPutStr
  ) where

import Prelude(FilePath, Int, (.))

import Control.Monad.IO.Class(MonadIO(..))
import Data.ByteString.Lazy(ByteString)
import qualified Data.ByteString.Lazy
import System.IO(Handle)

-- | Lifted 'Data.ByteString.Lazy.getContents'
getContents :: MonadIO m => m ByteString
getContents = liftIO Data.ByteString.Lazy.getContents

-- | Lifted 'Data.ByteString.Lazy.putStr'
putStr :: MonadIO m => ByteString -> m ()
putStr = liftIO . Data.ByteString.Lazy.putStr

-- | Lifted 'Data.ByteString.Lazy.putStrLn'
putStrLn :: MonadIO m => ByteString -> m ()
putStrLn = liftIO . Data.ByteString.Lazy.putStrLn

-- TODO Maybe remove or replace putStrLn as it's deprecated
-- in favour of 'Data.ByteString.Char8.putStrLn'

-- | Lifted 'Data.ByteString.Lazy.interact'
interact :: MonadIO m => (ByteString -> ByteString) -> m ()
interact = liftIO . Data.ByteString.Lazy.interact

-- | Lifted 'Data.ByteString.Lazy.readFile'
readFile :: MonadIO m => FilePath -> m ByteString
readFile = liftIO . Data.ByteString.Lazy.readFile

-- | Lifted 'Data.ByteString.Lazy.writeFile'
writeFile :: MonadIO m => FilePath -> ByteString -> m ()
writeFile fp = liftIO . Data.ByteString.Lazy.writeFile fp

-- | Lifted 'Data.ByteString.Lazy.appendFile'
appendFile :: MonadIO m => FilePath -> ByteString -> m ()
appendFile fp = liftIO . Data.ByteString.Lazy.appendFile fp

-- | Lifted 'Data.ByteString.Lazy.hGetContents'
hGetContents :: MonadIO m => Handle -> m ByteString
hGetContents = liftIO . Data.ByteString.Lazy.hGetContents

-- | Lifted 'Data.ByteString.Lazy.hGet'
hGet :: MonadIO m => Handle -> Int -> m ByteString
hGet h = liftIO . Data.ByteString.Lazy.hGet h

-- | Lifted 'Data.ByteString.Lazy.hGetNonBlocking'
hGetNonBlocking :: MonadIO m => Handle -> Int -> m ByteString
hGetNonBlocking h = liftIO . Data.ByteString.Lazy.hGetNonBlocking h

-- | Lifted 'Data.ByteString.Lazy.hPut'
hPut :: MonadIO m => Handle -> ByteString -> m ()
hPut h = liftIO . Data.ByteString.Lazy.hPut h

-- | Lifted 'Data.ByteString.Lazy.hPutNonBlocking'
hPutNonBlocking :: MonadIO m => Handle -> ByteString -> m ByteString
hPutNonBlocking h = liftIO . Data.ByteString.Lazy.hPutNonBlocking h

-- | Lifted 'Data.ByteString.Lazy.hPutStr'
hPutStr :: MonadIO m => Handle -> ByteString -> m ()
hPutStr h = liftIO . Data.ByteString.Lazy.hPutStr h
