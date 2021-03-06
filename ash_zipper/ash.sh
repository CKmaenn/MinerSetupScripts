#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�O5�]ash.sh �kSۺ�3���������2�=@� �B{�I[�El�X2I ��+�N����s�ܹ�Lc�V����jw�A{k{���P�뫐:��J=� 	��?@A�p{��܁/��0��|5!K�~]�F��@�M�� Ak���ח�fRK,�>�(�4��A��Sp�<9͋�S)�W(�7iT)����%lI6�L�J1��H`"��j�k�G
�bT5>f�a�0YE�T阆��r��İ�L`��+Ka�j��f����V.ժ�Z�T]{mh岮ΐR���ʷ-���G
{�ؘ,���%��C�>��*�	qT���� ��Q��sh	Q� v@SK�ڙ�ȌEU
������Ǧь^w������_����asXۻ��-v�b�Ȯi\:�o����CmkP�ﮭ����zuv�w��V'g��յ�O�	r��<lo��uxޮ���D�7���i���M��6�v>��f�5ݾ*����ѶQiigp��J�2���M�	7�>�á�y:Z��Zk���zk�2h~�ͽ��T߽~0n����ڸ�����"uT��ʂ�ex�',�|d�w������U{�T������x�c�l����;�����s��5^;uWNV���x�8k����7Olt|s���!�X[��[��{��:?�1��F���ᰣu�J�D#�ȏս�T2��Y�SI����=t���/���� ��pԛ������E�%��%DxL�$�<��(���x�0�4	'��HFt��9��?Jl�%3��(�^�մ_@��Ǐ���C�5����&�g�2����3��7�ZW�*���+����/ ���/ [����)�Y�z����������P�x�#cH�o�(D�^8���'~pp7~�D� {t�5q���x�� �`ȟS~��¯�����Կ��Y��ݏ�{1~�����"�";u@�߅� �>4����]<ܷYv"�z��?��(�Q�SYN���c{���BqpՅ�L}�:Z_ 4�<�$^^Q�3C�����=�=3���N.sx�!�-����Hv9D΂������.6rH��՛GH�s�\���>O���V��Y�±��u�5i̓��㷡9�c ���E����+y�&���a�`���>΁�٭������i}�j-gҾe�|ȥlί,�_24=�a����0��d���Gsv�$|'v�ǃ9��̩���y���a�	C��v��s��H��$�=�@��2�����:����<{G_�YQ�i).���
FC�׎I,��* e(.�56gI=P(P�����'�uF$b.f�2/*��l��$`*��E���"��La�E$ds%@,�G�3%���y�]E��v}�r�L/>��yC��4o� �8��6��4?�2?�0��_h1��&`D�������Y�O�+�HK���g�)?S҇�9�ɴ����sr���J��t����_��b�'C;�Β���䮱HF
�;�T��b4�O{��O�,�����nq�S��X�����*�@�4�G�l���BRy7X��ӑ$����K~��9��u�s�"�.�7�[Bl�4�TɁ{/ƛFE+i� ���"��i�����Z~L�j�qm��6���NK�<H�ĵ��P\����2O��+i�.��=i^��9p\kYZ���t*-ͲP�5A��PcIb �I����F��%ӊ�����Z:�,fQ�,<b�~z�xp�iC���3�H�� �B�ĐE/Y�Z��}�G1ʠ��(��x���dh򠰜h�V,��ƳXU��<=m�EJAq=2�=lJ�Op�>/<9GN'��`�]쎯W˵���9EN�/��E:�P/�̤�M�X�	/�p�}&�������Y4���:o�(f�?��u�3��"�������c�6�̣  �Ry���}E�2΋(�6��T�K�j�T+�>���f�'��޻7��$���8a������c����M��������WH%z6J�U�ɵ�E���#e=��O��/�y*U^���m^�9c)��G�,��_<,��Gu��J��;
������GW/�OjI0�VEg�-Ǚ�2\�r��,�>�m�5�eT�f7��W�<��=zV|Y�=i�i�ɩ���LM�c�|��*�u)u���x<H #����{����z�!���S_���t;�ש�	��D;yyr�7���������E�y��N��N�c2��K���ć�\��'��g�W��t����:�w�n+¦�R.�j�Z��LQp�MfK$r	������l��+�e�b�1's�]��TxO��W�"��)�އf��S�0r'�"�C`����8v��K賧�៏�L+�ԧ��ǳ���tM�o�ylu
K~؝����I l�
^&Ml��~�ط�_�ϥ���]�+?�v9���wZ�l��ԡh�����V(O�R��y�K9���+��x�F��a�����0�-w��\���(����*��*�"����E�+))и��ٽ�+��OH���>��c�I!,�O���.K-��R����4A1%�F�X,�]Lǰ���O.$  