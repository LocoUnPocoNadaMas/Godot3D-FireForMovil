GDPC                                                                                        	   T   res://.godot/exported/133200997/export-14584830dbc22d3f76a596eed5f4948e-node_3d.scn �      
      �j	�J�j���� J�E    ,   res://.godot/global_script_class_cache.cfg  0             9>�ʱ�p�˛OL�7u    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex      �      �̛�*$q�*�́        res://.godot/uid_cache.bin  @      <       �3E��e3硍��       res://fire.gdshader                ��Q����T�s��r       res://icon.svg  �      �      C��=U���^Qu��U3       res://icon.svg.import   �      �       �
p��!��a&�M懫       res://node_3d.tscn.remap�      d       �k�	���c{oo�       res://project.binary@#      c      :�������P�>�                /*
	炎シェーダー by あるる（きのもと 結衣）
	Fire Shader by Yui Kinomoto @arlez80

	MIT License
*/
shader_type spatial;
render_mode depth_draw_opaque, unshaded, shadows_disabled;

uniform sampler2D noise_tex : hint_default_white;
uniform vec4 root_color : source_color = vec4( 1.0, 0.75, 0.3, 1.0 );
uniform vec4 tip_color : source_color = vec4( 1.0, 0.03, 0.001, 1.0 );

uniform float fire_alpha : hint_range( 0.0, 1.0 ) = 1.0;
uniform vec2 fire_speed = vec2( 0.0, 1.0 );
uniform float fire_aperture : hint_range( 0.0, 3.0 ) = 0.22;

/*
	noise_texを使わないパターン

float random( vec2 pos )
{ 
	return fract(sin(dot(pos, vec2(12.9898,78.233))) * 43758.5453);
}

float value_noise( vec2 pos )
{
	vec2 p = floor( pos );
	vec2 f = fract( pos );

	float v00 = random( p + vec2( 0.0, 0.0 ) );
	float v10 = random( p + vec2( 1.0, 0.0 ) );
	float v01 = random( p + vec2( 0.0, 1.0 ) );
	float v11 = random( p + vec2( 1.0, 1.0 ) );

	vec2 u = f * f * ( 3.0 - 2.0 * f );

	return mix( mix( v00, v10, u.x ), mix( v01, v11, u.x ), u.y );
}

float procedural_noise_tex( vec2 shifted_uv )
{
	return (
		value_noise( shifted_uv * 0.984864 ) * 20.0
	+	value_noise( shifted_uv * 2.543 ) * 10.0
	+	value_noise( shifted_uv * 9.543543 ) * 8.0
	+	value_noise( shifted_uv * 21.65436 ) * 5.0
	+	value_noise( shifted_uv * 42.0 ) * 2.0
	+	value_noise( shifted_uv * 87.135148 ) * 2.0
	+	value_noise( shifted_uv * 340.66534654 )
	) / 48.0;
}
*/

void fragment( )
{
	vec2 shifted_uv = UV + TIME * fire_speed;
	float fire_noise = texture( noise_tex, shifted_uv ).r;
	float noise = UV.y * ( ( ( UV.y + fire_aperture ) * fire_noise - fire_aperture ) * 75.0 );
	vec4 fire_color = mix( tip_color, root_color, noise * 0.05 );

	ALPHA = clamp( noise, 0.0, 1.0 ) * fire_alpha;
	ALBEDO = fire_color.rgb;
}
           GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[             [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://wlhtblux4iyl"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 RSRC                    PackedScene            ��������                                            ;      resource_local_to_scene    resource_name    lightmap_size_hint 	   material    custom_aabb    flip_faces    add_uv2    uv2_padding    radius    height    radial_segments    rings    script    interpolation_mode    interpolation_color_space    offsets    colors    noise_type    seed 
   frequency    offset    fractal_type    fractal_octaves    fractal_lacunarity    fractal_gain    fractal_weighted_strength    fractal_ping_pong_strength    cellular_distance_function    cellular_jitter    cellular_return_type    domain_warp_enabled    domain_warp_type    domain_warp_amplitude    domain_warp_frequency    domain_warp_fractal_type    domain_warp_fractal_octaves    domain_warp_fractal_lacunarity    domain_warp_fractal_gain    width    invert    in_3d_space    generate_mipmaps 	   seamless    seamless_blend_skirt    as_normal_map    bump_strength 
   normalize    color_ramp    noise    render_priority 
   next_pass    shader    shader_parameter/root_color    shader_parameter/tip_color    shader_parameter/fire_alpha    shader_parameter/fire_speed    shader_parameter/fire_aperture    shader_parameter/noise_tex 	   _bundled       Shader    res://fire.gdshader ��������      local://CapsuleMesh_mick5 +         local://Gradient_e1ht6 S         local://FastNoiseLite_b8y4g l         local://NoiseTexture2D_save2 �         local://ShaderMaterial_yq0wi �         local://PackedScene_xkst5 �         CapsuleMesh    	        �?      	   Gradient             FastNoiseLite             NoiseTexture2D    /            0                     ShaderMaterial 
   1          2          3             4        �?ƿ??���>  �?5        �?���<o�:  �?6   )   
ףp=
�?7   
         �?8   )   \���(\�?9                     PackedScene    :      	         names "         Node3D    StaticBody3D    MeshInstance3D    mesh    surface_material_override/0 	   Camera3D 
   transform    DirectionalLight3D    	   variants                               �?              �?              �?        �	A      node_count             nodes     )   ��������        ����                      ����                     ����                                  ����                           ����              conn_count              conns               node_paths              editable_instances              version             RSRC   [remap]

path="res://.godot/exported/133200997/export-14584830dbc22d3f76a596eed5f4948e-node_3d.scn"
            list=[]
           �3�T�>�   res://icon.svg�]��*	*   res://node_3d.tscn    <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
          ECFG      application/config/name         fire   application/run/main_scene         res://node_3d.tscn     application/config/features$   "         4.3    Forward Plus       application/config/icon         res://icon.svg     dotnet/project/assembly_name         fire4   rendering/textures/vram_compression/import_etc2_astc                      