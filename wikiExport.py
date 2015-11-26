import urllib2
from lxml import etree
import re
from HTMLParser import HTMLParser

wikiUrl = "http://www.sbgn.org/Special:Allpages"

tmp = urllib2.urlopen(wikiUrl)
contents = tmp.read()

html = etree.HTML(contents)
urls = html.xpath('//a/@href')

baseUrl = 'http://www.sbgn.org/Special:Export'

for url in urls:
    if url.startswith('/'):
        # Example: http://www.sbgn.org/Special:Export/Main_Page
        exportUrl = baseUrl + url

        print "URL: " + exportUrl

        tmp = urllib2.urlopen(exportUrl)
        contents = tmp.read()

        fileName = re.sub('[^0-9a-zA-Z]+', "_", url[1:]) + ".xml"

        #contents = HTMLParser().unescape(tmpContents.decode('utf-8'))
        #print contents

        f = open(fileName, "w")
        f.write(contents)
        f.close()
