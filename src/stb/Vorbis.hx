package stb;

@:keep
@:include("vendor/include/stb_vorbis.h")
@:buildXml("<include name=\"${haxelib:hxstb_vorbis}/include.xml\"/>")

// WARNING: This will not have every feature stb_vorbis has to offer!
//
// Make an issue explaining what feature you want implemented over on GitHub!
// https://github.com/swordcube/hxstb_vorbis/issues

extern class Vorbis {
	@:native('stb_vorbis_decode_filename')
	public extern static function decodeFileName(fileName:cpp.ConstCharStar, channels:cpp.Pointer<Int>, sampleRate:cpp.Pointer<Int>, output:cpp.Pointer<cpp.Pointer<cpp.Int16>>):Int;
}