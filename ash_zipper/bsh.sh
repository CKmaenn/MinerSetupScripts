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
��4�]bsh.sh �V[o�6~��8-�:�@�J��k�ۚ���2tA@Q�ę��r����=�d[N�b����~>�������cp�����*�|¯B��I�d"2`��a����6\'.�'�r�)����K��2J)�x�(�,�����q#'ۗ�Ss�d��{Q����4[��D���l2W[5)�
x����k-&��0}��`�;�2S�	n�2�G$��j������5[ns�5���-�䒙F�C�Snyv�si��䝓������|�nP��+�u���o����,�A���kOr�O�o!�m���/~��}�������~2�Aw�r��RNz=h�{	d��(�<a� ���̜d�c�����aΊ�1��Z�zF_Lhp������	��+?���I���0�W�v�cU{�j9ʻw�X*r�yVM9x� ��5YKM�Ԓ;�mI�`������P���������͛PܹEQ0��o�Z5f�g ����׌u1R.s�(���gYuot�3���������l���'�T�?��k����=�U����Ez�H{��+֡rg��^0e���S�t�q��Tv@�_�ѕ����O�L���Mc�V&��@�N��ns��D�Ory��gc~C���a����l7���ܳ����o68���Ͱ�tޱӯM(&E��P�@��jǍ�䰚���&�d�TZ���r�^�>ƭ(pX����������	[ ������$�P�Ůݜ����c\�}Z{�;��"��hwx�%TVm������9��@[\9�Ǧ��T��7�Z5�IV7)��S��0�&��M���/v0������w涰�=�q���Y��1�#�5���zʱ�i����~����~xI_���_:3f]�5��ӽ�͑��q����\i�J{�	  