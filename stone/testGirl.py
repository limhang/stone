#coding:utf-8
import requests
from lxml import etree
import re

output =open('zngirls.txt','w')

def downloadImageUrl(url_prefix,pages):
	for num in range(1,pages):
		if num == 1:
			url = url_prefix
		else:
			url = url_prefix + str(num) + '.html'
		r = requests.get(url)
		html = etree.HTML(r.text)
		result = html.xpath('//div[@class="post_entry"]/div[@class="listdiv"]/ul/li[@class="galleryli"]/div[@class="galleryli_div"]/a/img/@data-original')
		for src in result:
			directionNum = src[-17:-12]
			direction_url = 'http://www.zngirls.com/g/' + str(directionNum)
			countStr = downloadImageUrlCount(direction_url)
			count = re.sub("\D", "", countStr)
			for url_profix in range(0,int(count)):
				url_header = src[:-12]
				if url_profix == 0:
					url_complete = url_header + '/s/0.jpg'
				else:
					url_complete = url_header + '/s/' + '%03d'%url_profix + '.jpg'
				print(url_complete)
				output.write(url_complete)
				output.write("\n") # 换行




def downloadImageUrlCount(url):
	r = requests.get(url)
	html = etree.HTML(r.text)
	result = html.xpath('//div[@class="albumTitle"]/div[@class="albumInfo"]/span')[0].text
	return result

#尤果网
url_1 = 'http://www.zngirls.com/gallery/ugirl/'
#推女郎
url_2 = 'http://www.zngirls.com/gallery/tuigirl/'
#爱尤物
url_3 = 'http://www.zngirls.com/gallery/aiyouwu/'
downloadImageUrl(url_1,10)
downloadImageUrl(url_2,3)
downloadImageUrl(url_3,19)

output.close()

