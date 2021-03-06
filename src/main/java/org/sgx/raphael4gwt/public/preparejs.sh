ALL=raphael4gwt-all

YUIC=../../../../../yuicompressor-2.4.7.jar

#minify first

java -jar $YUIC --line-break 200 -o raphael-min.js raphael.js

java -jar $YUIC --line-break 200 -o raphael-ext-min.js raphael-ext.js

java -jar $YUIC --line-break 200 -o raphael.free_transform-min.js raphael.free_transform.js

java -jar $YUIC --line-break 200 -o raphael-svg-filter-min.js raphael-svg-filter.js

#cp raphael4gwt.js raphael4gwt-min.js #do not compress cause it has a debugger;
java -jar $YUIC --line-break 200 -o raphael4gwt-min.js raphael4gwt.js

cat raphael-ext-min.js > $ALL-min.js
cat raphael.free_transform-min.js >> $ALL-min.js
cat raphael-svg-filter-min.js >> $ALL-min.js
cat raphael4gwt-min.js >> $ALL-min.js


echo "/* raphael-ext */" > $ALL.js
cat raphael-ext.js >> $ALL.js

echo "/* raphael-svg-filter */" >> $ALL.js
cat raphael-svg-filter.js >> $ALL.js

echo "/* raphael.free_transform */" >> $ALL.js
cat raphael.free_transform.js >> $ALL.js

echo "/* raphael4gwt */" >> $ALL.js
cat raphael4gwt.js >> $ALL.js

cp raphael-min.js raphael4gwt-all-min.js ../raphael/scripts

#cd graphael
#sh preparejs.sh
#cd ..