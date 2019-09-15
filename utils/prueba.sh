<<<<<<< Updated upstream
#!/bin/bash

. $AUTOSCRIPT_PATH/utils/ioutils.sh

request_confirmation "Hello $BGreen$(whoami)$Coloroff"

if [[ $? == 0 ]];then
	echo "Confirmed"
else
	echo "Not confirmed"
if
=======
. $AUTOSCRIPT_PATH/utils/ioutils.sh

request_confirmation "Hello $BGreen$(whoami)$Coloroff "
>>>>>>> Stashed changes
