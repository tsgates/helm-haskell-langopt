import Text.XML.HXT.Core
import Text.XML.HXT.XPath
import Text.XML.HXT.DOM.XmlNode as N
import Text.HandsomeSoup
import Control.Monad
import Data.List
import Text.Printf
import System.IO
import Text.Regex
  
urlGHC = "http://www.haskell.org/ghc/docs/latest/html/users_guide/flag-reference.html"

asText = arr $ \tree -> mconcat $ map N.getText (N.nodesTree tree)
  where mconcat = concatMap (maybe "" id)

trim = map $ \(o, d) -> (drop 2 o, cleanup d)
  where cleanup d = subRegex (mkRegex "[ \n\"]+") d " "

onlyLang = filter $ \(o, _) -> (isPrefixOf "-X" o)

main = do
    doc <- fromUrl urlGHC
    opt <- runX $ doc >>> css "div"
                      >>> hasAttrValue "title" (isInfixOf "Language options")
                      //> (getXPathTrees "tr/td[1]" &&& getXPathTrees "tr/td[2]")
                      >>> (asText *** asText)
    forM_ (trim $ onlyLang opt) $ \(o, d)->
      hPrintf stdout "\"%-30s: %s\"\n" o d
