package stb;

/**
 * WARNING: This will not have every feature stb_vorbis has to offer!
 *
 * Make an issue explaining what feature you want implemented over on GitHub!
 * @see https://github.com/swordcube/hxstb_vorbis/issues
 */
@:buildXml('<include name="${haxelib:hxstb_vorbis}/include.xml" />')
@:include('vendor/include/stb_vorbis.h')
@:unreflective
extern class Vorbis
{
	@:native('stb_vorbis_decode_filename')
	static function decodeFileName(fileName:cpp.ConstCharStar, channels:cpp.Star<Int>, sampleRate:cpp.Star<Int>, output:cpp.RawPointer<cpp.RawPointer<cpp.Int16>>):Int;
}
