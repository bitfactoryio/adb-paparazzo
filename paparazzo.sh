id="$1"
ssize=""
adb devices | while read line
do
    if [ ! "$line" = "" ] && [ `echo $line | awk '{print $2}'` = "device" ]
    then
		device=`echo $line | awk '{print $1}'`
		fileName="$id-$deviceinfo.png"
    	
        echo "$device $@ ..."
        adb -s $device shell screencap -p /sdcard/$id.png
        adb -s $device pull /sdcard/$id.png

        deviceinfo=$(adb -s $device shell getprop ro.product.model)

        $deviceinfo = $(echo $deviceinfo|tr -d '\r')

        echo $deviceinfo

        $deviceinfo = "$deviceinfo.png"

		mv $id.png "$id-$deviceinfo.png"
        
    fi
done