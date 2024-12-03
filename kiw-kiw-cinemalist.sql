PGDMP      :                |            kiw-kiw-cinemalist    17.2    17.2     	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    17205    kiw-kiw-cinemalist    DATABASE     �   CREATE DATABASE "kiw-kiw-cinemalist" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
 $   DROP DATABASE "kiw-kiw-cinemalist";
                     postgres    false            �            1259    17218 
   movie_list    TABLE     \  CREATE TABLE public.movie_list (
    movie_id integer NOT NULL,
    title character varying(200) NOT NULL,
    movie_year integer NOT NULL,
    poster_path text NOT NULL,
    rating numeric(3,1) NOT NULL,
    genre character varying(255) NOT NULL,
    overview text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.movie_list;
       public         heap r       postgres    false            �            1259    17227    movie_status    TABLE       CREATE TABLE public.movie_status (
    id integer NOT NULL,
    id_user integer NOT NULL,
    id_movie integer NOT NULL,
    like_status boolean DEFAULT false NOT NULL,
    plan_to_watch_status boolean DEFAULT false NOT NULL,
    completed_status boolean DEFAULT false NOT NULL
);
     DROP TABLE public.movie_status;
       public         heap r       postgres    false            �            1259    17226    movie_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movie_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.movie_status_id_seq;
       public               postgres    false    221                       0    0    movie_status_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.movie_status_id_seq OWNED BY public.movie_status.id;
          public               postgres    false    220            �            1259    17207 	   user_list    TABLE     ,  CREATE TABLE public.user_list (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(60) NOT NULL,
    password character varying(255) NOT NULL,
    profile_picture character varying(255) DEFAULT 'blank-profile-picture.png'::character varying NOT NULL
);
    DROP TABLE public.user_list;
       public         heap r       postgres    false            �            1259    17206    user_list_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_list_id_seq;
       public               postgres    false    218                       0    0    user_list_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.user_list_id_seq OWNED BY public.user_list.id;
          public               postgres    false    217            c           2604    17230    movie_status id    DEFAULT     r   ALTER TABLE ONLY public.movie_status ALTER COLUMN id SET DEFAULT nextval('public.movie_status_id_seq'::regclass);
 >   ALTER TABLE public.movie_status ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    221    221            `           2604    17210    user_list id    DEFAULT     l   ALTER TABLE ONLY public.user_list ALTER COLUMN id SET DEFAULT nextval('public.user_list_id_seq'::regclass);
 ;   ALTER TABLE public.user_list ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218                      0    17218 
   movie_list 
   TABLE DATA           s   COPY public.movie_list (movie_id, title, movie_year, poster_path, rating, genre, overview, created_at) FROM stdin;
    public               postgres    false    219   4                 0    17227    movie_status 
   TABLE DATA           r   COPY public.movie_status (id, id_user, id_movie, like_status, plan_to_watch_status, completed_status) FROM stdin;
    public               postgres    false    221   �3                 0    17207 	   user_list 
   TABLE DATA           S   COPY public.user_list (id, username, email, password, profile_picture) FROM stdin;
    public               postgres    false    218   j4                  0    0    movie_status_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.movie_status_id_seq', 34, true);
          public               postgres    false    220                       0    0    user_list_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.user_list_id_seq', 2, true);
          public               postgres    false    217            l           2606    17225    movie_list movie_list_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.movie_list
    ADD CONSTRAINT movie_list_pkey PRIMARY KEY (movie_id);
 D   ALTER TABLE ONLY public.movie_list DROP CONSTRAINT movie_list_pkey;
       public                 postgres    false    219            n           2606    17235    movie_status movie_status_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.movie_status
    ADD CONSTRAINT movie_status_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.movie_status DROP CONSTRAINT movie_status_pkey;
       public                 postgres    false    221            h           2606    17217    user_list user_list_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.user_list
    ADD CONSTRAINT user_list_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.user_list DROP CONSTRAINT user_list_email_key;
       public                 postgres    false    218            j           2606    17215    user_list user_list_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.user_list
    ADD CONSTRAINT user_list_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.user_list DROP CONSTRAINT user_list_pkey;
       public                 postgres    false    218            o           2606    17241 '   movie_status movie_status_id_movie_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movie_status
    ADD CONSTRAINT movie_status_id_movie_fkey FOREIGN KEY (id_movie) REFERENCES public.movie_list(movie_id);
 Q   ALTER TABLE ONLY public.movie_status DROP CONSTRAINT movie_status_id_movie_fkey;
       public               postgres    false    219    221    4716            p           2606    17236 &   movie_status movie_status_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movie_status
    ADD CONSTRAINT movie_status_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.user_list(id);
 P   ALTER TABLE ONLY public.movie_status DROP CONSTRAINT movie_status_id_user_fkey;
       public               postgres    false    4714    218    221                  x��ZKvۼ�˫�M�ә��E�z03�-?�ď8��	DB",��	R2=����^B��wrW�_@Ɏu�ْH ���*��(�Q�>�ޣJc�VOu��v�A��}������c�&�^\��Uq�腷��|����8SKQ*��{w��Y$�S�/N�R�uk<+e�	�$*_2Z�{"�TV�4Us��^A�z�HSI'x���LY�,�g���U��DLU�o�I�Sۻמ���ZI���Q�ē�J:[b�}^k���xkU&��}����8yJcl]H��tA[�"OD�}�bZ{s��l�F��A����/��K����a��ð7�ΥX�,�q�*J�B'l���z�X��_���a:���]�<�u�-Y��v�u\����.�׺Й(HH�R��+]MS�-ł>Jg)e�����RC��5V�f��Gf�^z��!�aK�����ГʰI
I2G���s�J�D��)�-�xߗb!YA��a����dҋE�﹣�a�W�����c�ڍ�_�w��*����q��.�tXx)�s��Hua��R�(q��G�St��{��Y�"Qʃ���X;��3%ޠg
C�$_ɗ
N����v?�a�� l��"V��r���n�������6��xy{(/V���w���.8�1N\V�l��p\Op��M32�ꉥ��B=���+YH2d��k�^+��W��`�*�R�骊�P捑�%Yo�T#��ۙ^�(@�Hg�� �����A��w�̱?�N��鵗JA6ƛcڈ?okS�UA��K��dҺ��4���>A$CN�� r�^�����Er�/��La ���3t�3�^[H���s���=���M�[s��tg\��^7�{�?�A�uv=��,<}	�I:�|}H���MO�\=_��Sp�,��X��PK���zL$p
��(��6ơ�jA�\,*:�À�o�J�i|\�[D��
ϋ�A٬�� ��k����/ر �_�/3Fdψ�.�}������`o���ۺ�ǥƉ^�/����$}	otW����Wgˠg.X�~{��C*�O
t/\2x��dϹ*R���ڄ<$/��+�Y�<�.z� ��UL�R���ɠ2��'�+�s��d���vg4$#�A?��q�ݿ��Ti�H<����2���N�Bio�����\�tNY�!�}�D��ao�6��|ΰ�t�*�)��LN���[e	o���ZWx��!b3�J��'��)
��&��6�B�j�7U3F�%E =�L
���i~�G�p�a���-�=�J����������N��E~��&at?�qN���� ����H V{�I�u;A�pg���;bGe���s��^�.J� �Ct�!��$���&p���T���R���ĹbN��	"����HAF�Ҳ�aL�S��w�2�F�,Tuۛ�5,Q��B΅}J!�
)c�ܥu��H�p�u[����Z����6�8�{�����׸�n�=7g�Sq����,�ڪ�Z�uVT,��n`��4��翮E1���I����T���); L���S��Zs涣�/��>�e��ᑁ�����X���iRc}ظ�3���_�YNzWPROC_fr��_�T���>� S��s����u�) �,1ja���������+{b�c�`��HXMϯ�9�v-֕��5��v�2�����A
E����7xS@�.ȁѠ����Z)s�J�}'�?$��Td"�Sz5�BR�)��(��bn��� G�󏫢�OY(�6�Y���M:���u�3����� �>\� ]�D�[<-�P��26q��2���B8FZxoI{(HQ"����!�t!)�es�Ϧɇ u�&6�52C�j�P�U���V���p0�uF{~�;@l}SH�XR��;b��F����:��}=9��L
�8){j5��~�͜�ÿ!�ȶ.0F���3�j>gxG� i��5�v� ]�>�W��bi�@�;�>ɶ��S%��?d&_+�"6�g\�(<�(�i���4�����dS�BL�]ӕcV͙>@���?��pi�Cɽv/�A����:JA��L�ة��=����xu����Y�x|��*�g�.��#�lTp����FXu�m�*��&FD�?�����|��;��e�#1 ��O$,k��	Y8wn6�66Y���[���lT��� ���j��dZ���{���'�E�L@FB�-l-�u�,Ā�nq�G��=��Sb���������$�� ��0`8�LR��	Uϐ"�Sq�2IW�;
7�2���~�EF�|����n�
	fy;�#�X�������E6Y��W���|��[N��Ak����G#96@u��$����(V����� ��+���Ț�/aːp�����\�_#\e�`͠�΁B�Y�b�J91�$��
hɪmBEV�2ZPw�M�iQ��/$���`��4n�Rq���"�l8� �k�J�l�oʃ�D�Y� w~Tc�J���k8��jn3��c���=�/��=9SB�h��2�X�F�j�%��*Iɝ��FNW�[�q��s�.��Q�*8w�;�3�һ{߳R)�;�/锍�8 6-��R�-��야������U��\j�e`��z�u6zR;K��=����p��t�n���B6���ǧ�ǫ��������~ވ������|H�Me���	�6<���C�9ݚ\��R,WdJ�b6	,o�Ϲl��S+�����Qd,�9��j{��Pi�<��T�(��\�\n#��+6�G�r�U�rn��/a�"W1�h����H�Wdk�bu��v)w�aoz���;��u��I�����:|��q�00���ivv��x>�@���1	�K=G�הK�ϵ]��F�pY;��.��VK�����AЛ�����kc���w��{����Bt?�w���'�W7��_���x(��F���t��˗����=��Ǐ�w9����c���v�}[d�0M��ǩm����T����.�^]_��~;/!�r�!�����g�2��0�N|M+A΅8�n��fm�:.��=1�X�5l��T�A����c���X�"�'�4���J�L��a* #i���x7q�wC~��䖘*P*v� �ׂV)*�~��=P�?�������s��T��x� �vZ�b�؄��K�y�5Yced+A����*-	�Em�UԸ#��4F�>�0Nӏ�.D���T���_I��ǉb���MQ�ҹb�TI4������1��@�C���;�=3�J�YcDǃ���#��=��ʹ[<t��q��p�jr�D�Ҧ���fw�<j�12����aT+x[�O҆�䟔���XY8��PI�7[K����=��A�	��������p;��ס6̠� ���u���l�o&��eTd��X��ވ��q�����k���aų�k�#�'�*�:����Us�+"�hI&�
��1W��~jN��rp�&,�`��#K[u�]�|G��ƽO$�'h<]���~{�v�`/m��4i��*����m���������~v;1��
�����Y7qٶ�>���7qu-
��޸�^]�����0"*�#�z�2B�n������3�7�"@v���!ʗ�6��NyOA	��>����4��+ה�o�<%�I+��^��ԑa���%wi l�Esv�id��h���=��a)��)v'0(��wG��<u����M.���àW��O��FR'��So=�M.s	l;KtYV�S7v��D��"S]K��U��_T:)�)�Q�E��⸓
MlN�K�a�����^0��m�H�$D�����W�쟈_�燯ŷ����_�iv�}8�?G�ɀ�5�O�,�)���=�zS!uVȐp�"��h(.*_�P��@�}F�.A<�)��"����lǿ�Q�?>y �8�������q�b�f�H!���ñW�_�uQ��Aڒ���ͷ&�r�f��������(<�uf�ok���Ƌ��?h��������Mb�RD�T5z<���;n�,",[���8��v���ro5 �  L��Z�<C�n{�c�ڣ�?�za7�`�n�2��DϽ��xt[OG�*�5�����q�?���o��#v��η���t�x�}�2��EJ,���*5�NY�¢ӬJ��JԪ0��E��b�}s��kV~��c�ԇsS#V�.�+;7ﳉ^L���.t�І��'l=����=�Ve�	/傋Y��iG�K��5�l
GA͘s�i%���f��d��ha;�C�x�a/@�w���k�Ż�08V����A�pt�+�'��������٢z�t���>6�6�@	)�_ӧ<BIFz�!9�5��J�i����r+���k��f���M�E��M�)�!b���.Rf(�����p�m�-�t�:�r��
�[���s�z�/&�����Y�Pk�q]��@�MÅ{���@�e~� ڧ���+�9��۩�[�:N!2!�4��#Ƕ��J,���#,fhM�T�'9 �7p%��t��TSM�ZtJ���~_���4c���e���Dk�n���R0m��K?��TϘ\q.w���{������� up��������4�R�t�N�&��X�vNLƉ<����|}7f�X�m���4���ң�9� ��rm��+m�+m���2�����7}b~�p��^U0�+G��5}&6�90v�f������_�5��~��M�.�Χ�����289ͣ�����`��[�내��T+�c@�F;~���S"�7QSyk��`6��:�S�yS \�ʦ�Ql��1m���7�Aλ�Bh'�oz�k{=�]M�T� �p{��ny�n�� �e0��A��!��N�7��k96iq�,|՛�����a<������C��ƶ��C�\`�_p���%�2X��=TLع�!�8�n'w��Y����(98�Ap�6
���R�MK;�X�xSR#J[�r����"N<��`s\�c��_�Ѭ-���gs�.�Рr�{e�6�-Z�t��� խ�q:��X��6C��f*EC���~�ELehtB}�L6g�E�Z�_R���L�煢��"�C��v���#j���o�3�*ؠ!#�������f������'O���f����y�6�#���Cs��+�Q���x� �Hw�*���g�����dh�oJ,O�xh ��ƅ�V�%,�IȠTq�T��Z>ѩ":H!EY(��b�y>�T�w%耛��ZY�f�+ڜ�z�#S���5�=�5n�d��sa���
{��x�.͕$n2ڣ��2����~S��[��͆ˉ�\)н�S��C�D���)ݬ���~,����~�B��ezs
3�d}���~�?���z}��c)✚���=j��^ÕFQ�������������΃rpr|]M����o���֎ab��E̗R���Dl�ZpS%��)�x���4!@���,�/�oO��#�@4"�;Ӻ�DUnGDT��t7h�EJ�JE���z�����
�VQ��I׫*UPe��тyof���g�ܥ�~;�{�^�7G�ѰuO]U�%��lf���y�<���G7����դ�q�>������-�9�/W�H��Y(�9�h��w��܅��`�u<� NR�n�r
̚~_S��U%��wō\���q���\�vC�wM�X4v?�� �.�L1v�%Ye�h��{{{���3A         �   x�=��C1C��0`�Kϙ�����T9���X0d0�&���>S���d��cOYE�U��Ԕ���y)TV�dRi�����Q1pw���K���X�7�#3-�f��\���:o}^���~��ED�G�ל�v,�         f   x�3�N�L�,鹉�9z����*F�*�*����I!��i�.E�!�i����z�>%�n�i��y�f>9�^�!F�z�>����Μ��yzy�\1z\\\ �y     