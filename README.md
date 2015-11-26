# Build Image

```
docker build -t cannin/mediawiki-export-convert .
```

# Run image
## First shell
```
docker run -i \
  --rm=TRUE \
  --name=m2m \
  -v HOST_PATH:/m2m \
  -t cannin/mediawiki-export-convert \
  /bin/bash  
```

## Additional shells
```
docker exec -i -t swath /bin/bash 
```

## Download wiki
```
python /m2m/wikiExport.py
```

# Run conversion (one file)
```
php mediawiki-to-markdown/convert.php --filename=/m2m/Main_Page.xml --output=/m2m/github_export
```

# Run conversion (all files)
```
for file in /m2m/*.xml
do
  php /mediawiki-to-markdown/convert.php --filename=$file --output=/m2m/github_export
done
```

# Mirror website with wget
```
mkdir -p /m2m/wgetMirror
cd /m2m/wgetMirror/
wget --mirror --convert-links --adjust-extension --page-requisites --no-parent http://sbgn.org/
wget --mirror http://sbgn.org

wget \
 --recursive \
 --no-clobber \
 --page-requisites \
 --html-extension \
 --convert-links \
 --domains sbgn.org \
 --no-parent \
 www.sbgn.org

```

