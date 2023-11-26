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
extern class Vorbis {
	@:native('stb_vorbis_decode_filename')
	@:noCompletion
	private static function __decodeFileName(fileName:cpp.ConstCharStar, channels:cpp.Star<Int>, sampleRate:cpp.Star<Int>, output:cpp.RawPointer<cpp.RawPointer<cpp.Int16>>):Int;

	public static inline function decodeFileName(fileName:cpp.ConstCharStar, channels:cpp.Star<Int>, sampleRate:cpp.Star<Int>, output:cpp.RawPointer<cpp.Int16>) {
		var totalFrameCount:Int = 0;
		untyped __cpp__('short *output;
		{0} = {1}({2}, {3}, {4}, &output);
		{5} = output', totalFrameCount,
			__decodeFileName, fileName, cpp.RawPointer.addressOf(channels), cpp.RawPointer.addressOf(sampleRate), sampleData);
		return totalFrameCount;
	}
}
