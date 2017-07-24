{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_CIS194_HW01 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/tessmero/haskell/CIS194-HW01/.stack-work/install/x86_64-linux/lts-8.23/8.0.2/bin"
libdir     = "/home/tessmero/haskell/CIS194-HW01/.stack-work/install/x86_64-linux/lts-8.23/8.0.2/lib/x86_64-linux-ghc-8.0.2/CIS194-HW01-0.1.0.0-7nvivev9gIXl0S4Ad8K71"
dynlibdir  = "/home/tessmero/haskell/CIS194-HW01/.stack-work/install/x86_64-linux/lts-8.23/8.0.2/lib/x86_64-linux-ghc-8.0.2"
datadir    = "/home/tessmero/haskell/CIS194-HW01/.stack-work/install/x86_64-linux/lts-8.23/8.0.2/share/x86_64-linux-ghc-8.0.2/CIS194-HW01-0.1.0.0"
libexecdir = "/home/tessmero/haskell/CIS194-HW01/.stack-work/install/x86_64-linux/lts-8.23/8.0.2/libexec"
sysconfdir = "/home/tessmero/haskell/CIS194-HW01/.stack-work/install/x86_64-linux/lts-8.23/8.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "CIS194_HW01_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "CIS194_HW01_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "CIS194_HW01_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "CIS194_HW01_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "CIS194_HW01_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "CIS194_HW01_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
