package stb;

import cpp.RawConstPointer;
import cpp.CastCharStar;
import cpp.ConstStar;
import cpp.UInt8;
import cpp.UInt32;

typedef ConstUChar = ConstStar<UInt8>;
typedef DoubleRawPointer<T> = cpp.RawPointer<cpp.RawPointer<T>>;
typedef TripleRawPointer<T> = cpp.RawPointer<cpp.RawPointer<cpp.RawPointer<T>>>;

// WARNING: This will not have every feature stb_vorbis has to offer!
// Make an issue explaining what feature you want implemented over on GitHub!
// https://github.com/swordcube/hxstb_vorbis/issues

@:keep
@:buildXml('<include name="${haxelib:hxstb_vorbis}/include.xml" />')
@:include('vendor/include/stb_vorbis.h')
extern class Vorbis {
	@:native('stb_vorbis_decode_filename')
	@:noCompletion
	private static function __decodeFileName(fileName:cpp.ConstCharStar, channels:cpp.Star<Int>, sampleRate:cpp.Star<Int>, output:DoubleRawPointer<cpp.Int16>):Int;

	@:native('stb_vorbis_get_frame_float')
	@:noCompletion
	private static function __getFrameFloat(vorbis:StbVorbis, channels:cpp.RawPointer<Int>, output:TripleRawPointer<Single>):Int;
	
	@:native('stb_vorbis_decode_frame_pushdata')
	private static function __decodeFramePushData(vorbis:StbVorbis, dataBlock:ConstUChar, dataBlockLengthInBytes:Int, channels:cpp.RawPointer<Int>, output:TripleRawPointer<Single>, samples:cpp.RawPointer<Int>):Int;

	@:native('stb_vorbis_close')
	public static function close(vorbis:StbVorbis):Int;

	@:native('stb_vorbis_seek_frame')
	public static function seekFrame(vorbis:StbVorbis, sampleNumber:UInt32):Int;

	@:native('stb_vorbis_seek')
	public static function seek(vorbis:StbVorbis, sampleNumber:UInt32):Int;

	@:native('stb_vorbis_seek_start')
	public static function seekStart(vorbis:StbVorbis):Int; // Shortcut to Vorbis.seek(f, 0);

	@:native('stb_vorbis_stream_length_in_samples')
	public static function streamLengthInSamples(vorbis:StbVorbis):UInt32;

	@:native('stb_vorbis_stream_length_in_seconds')
	public static function streamLengthInSeconds(vorbis:StbVorbis):Single;

	@:native('stb_vorbis_open_pushdata')
	public static function openPushData(dataBlock:ConstUChar, dataBlockLengthInBytes:Int, dataBlockMemoryConsumedInBytes:cpp.RawPointer<Int>, error:cpp.RawPointer<Int>, allocBuffer:RawConstPointer<STB_Vorbis_Alloc>):StbVorbis;

	public static inline function decodeFileName(fileName:cpp.ConstCharStar, channels:cpp.Star<Int>, sampleRate:cpp.Star<Int>, output:cpp.RawPointer<cpp.Int16>) {
		var totalFrameCount:Int = 0;
		untyped __cpp__('short *_coutput;
		{0} = {1}({2}, {3}, {4}, &_coutput);
		{5} = _coutput', totalFrameCount,
			__decodeFileName, fileName, cpp.RawPointer.addressOf(channels), cpp.RawPointer.addressOf(sampleRate), output);
		return totalFrameCount;
	}

	public static inline function getFrameFloat(vorbis:StbVorbis, channels:cpp.Star<Int>, output:cpp.RawPointer<Single>) {
		var totalFrameCount:Int = 0;
		untyped __cpp__('short **_coutput;
		{0} = {1}({2}, {3}, &_coutput);
		{4} = _coutput', totalFrameCount,
			__getFrameFloat, vorbis, cpp.RawPointer.addressOf(channels), output);
		return totalFrameCount;
	}

	public static inline function decodeFramePushData(vorbis:StbVorbis, dataBlock:cpp.ConstCharStar, dataBlockLengthInBytes:Int, channels:cpp.Star<Int>, output:cpp.RawPointer<Single>, samples:cpp.Star<Int>):Int {
		var bytesUsed:Int = 0;
		untyped __cpp__('short **_coutput;
		{0} = {1}({2}, {3}, {4}, {5}, &_coutput, {7});
		{6} = _coutput', bytesUsed,
			__decodeFramePushData, vorbis, dataBlock, dataBlockLengthInBytes, cpp.RawPointer.addressOf(channels), output, cpp.RawPointer.addressOf(samples));
		return bytesUsed;
	}
}

@:native("stb_vorbis_alloc")
@:include('vendor/include/stb_vorbis.h')
@:structAccess
extern class STB_Vorbis_Alloc {
	@:native("alloc_buffer")
	var allocBuffer:CastCharStar;

	@:native("alloc_buffer_length_in_bytes")
	var allocBufferLengthInBytes:Int;
}

typedef StbVorbisAlloc = cpp.Pointer<STB_Vorbis_Alloc>;

@:native("stb_vorbis")
@:include('vendor/include/stb_vorbis.h')
@:structAccess
extern class STB_Vorbis {}

typedef StbVorbis = cpp.Pointer<STB_Vorbis>;