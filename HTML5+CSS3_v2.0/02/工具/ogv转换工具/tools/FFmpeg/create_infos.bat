@echo off

set ffdir=.
set ffmpeg=%ffdir%\ffmpeg.exe
set Line=--------------------------------------------------------------------------------
set infodir=%ffdir%\info
set infodir_encoders=%infodir%\encoders
set infodir_decoders=%infodir%\decoders
set infodir_muxers=%infodir%\muxers
set infodir_demuxers=%infodir%\demuxers

mkdir %infodir%
mkdir %infodir_encoders%
mkdir %infodir_decoders%
mkdir %infodir_muxers%
mkdir %infodir_demuxers%


%ffmpeg% -version > %ffdir%\ffmpeg_VERSION.txt

%ffmpeg% -version > %ffdir%\ffmpeg_HELP.txt
%ffmpeg% -h >> %ffdir%\ffmpeg_HELP.txt

%ffmpeg% -version > %ffdir%\ffmpeg_HELP_long.txt
%ffmpeg% -h long >> %ffdir%\ffmpeg_HELP_long.txt

%ffmpeg% -version > %ffdir%\ffmpeg_HELP_full.txt
%ffmpeg% -h full >> %ffdir%\ffmpeg_HELP_full.txt

for %%x in (formats,codecs,decoders,encoders,protocols,bsfs,filters,pix_fmts,layouts,sample_fmts) do (
%ffmpeg% -version > %ffdir%\ffmpeg_%%x.txt
echo %Line% >> %ffdir%\ffmpeg_%%x.txt
%ffmpeg% -%%x >> %ffdir%\ffmpeg_%%x.txt
)

for %%x in (a64multi,a64multi5,alias_pix,amv,asv1,asv2,avrp,avui,ayuv,bmp,cinepak,cljr,dnxhd,dpx,dvvideo,ffv1,ffvhuff,flashsv,flashsv2,flv,gif,h261,h263,h263p,huffyuv,jpeg2000,jpegls,ljpeg,mjpeg,mpeg1video,mpeg2video,mpeg4,msmpeg4v2,msmpeg4,msvideo1,pam,pbm,pcx,pgm,pgmyuv,png,ppm,prores,prores_aw,prores_ks,qtrle,r10k,r210,rawvideo,roqvideo,rv10,rv20,sgi,snow,sunrast,svq1,targa,libtheora,tiff,utvideo,v210,v308,v408,v410,wmv1,wmv2,xbm,xface,xwd,y41p,yuv4,zlib,zmbv) do (
echo VIDEO ENCODER %%x
%ffmpeg% --help encoder=%%x > %infodir_encoders%\video_%%x.txt
)

for %%x in (aac,ac3,ac3_fixed,adpcm_adx,g722,g726,adpcm_ima_qt,adpcm_ima_wav,adpcm_ms,adpcm_swf,adpcm_yamaha,alac,comfortnoise,dca,eac3,flac,g723_1,mp2,mp2fixed,nellymoser,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16be_planar,pcm_s16le,pcm_s16le_planar,pcm_s24be,pcm_s24daud,pcm_s24le,pcm_s24le_planar,pcm_s32be,pcm_s32le,pcm_s32le_planar,pcm_s8,pcm_s8_planar,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,real_144,roq_dpcm,s302m,sonic,sonicls,tta,vorbis,libvorbis,wavpack,wmav1,wmav2) do (
echo AUDIO ENCODER %%x
%ffmpeg% --help encoder=%%x > %infodir_encoders%\audio_%%x.txt
)

for %%x in (ass,dvbsub,dvdsub,mov_text,srt,ssa,subrip,webvtt,xsub) do (
echo SUBTITLE ENCODER %%x
%ffmpeg% --help encoder=%%x > %infodir_encoders%\subtitle_%%x.txt
)

for %%x in (012v,4xm,8bps,aasc,aic,alias_pix,amv,anm,ansi,asv1,asv2,aura,aura2,avrn,avrp,avs,avui,ayuv,bethsoftvid,bfi,binkvideo,bintext,bmp,bmv_video,brender_pix,c93,cavs,cdgraphics,cdxl,cinepak,cljr,cllc,eacmv,cpia,camstudio,cyuv,dfa,dirac,dnxhd,dpx,dsicinvideo,dvvideo,dxa,dxtory,escape124,escape130,exr,ffv1,ffvhuff,fic,flashsv,flashsv2,flic,flv,fraps,frwu,g2m,gif,h261,h263,h263i,h263p,h264,hevc,hnm4video,huffyuv,idcinvideo,idf,iff,iff,indeo2,indeo3,indeo4,indeo5,interplayvideo,jpeg2000,jpegls,jv,kgv1,kmvc,lagarith,loco,eamad,mdec,mimic,mjpeg,mjpegb,mmvideo,motionpixels,mpeg1video,mpeg2video,mpegvideo,mpeg4,msa1,msmpeg4v1,msmpeg4v2,msmpeg4,msrle,mss1,mss2,msvideo1,mszh,mts2,mvc1,mvc2,mxpeg,nuv,paf_video,pam,pbm,pcx,pgm,pgmyuv,pictor,png,ppm,prores,prores_lgpl,ptx,qdraw,qpeg,qtrle,r10k,r210,rawvideo,rl2,roqvideo,rpza,rv10,rv20,rv30,rv40,sanm,sgi,sgirle,smackvid,smc,smvjpeg,snow,sp5x,sunrast,svq1,svq3,targa,targa_y216,eatgq,eatgv,theora,thp,tiertexseqvideo,tiff,tmv,eatqi,truemotion1,truemotion2,camtasia,tscc2,txd,ultimotion,utvideo,v210,v210x,v308,v408,v410,vb,vble,vc1,vc1image,vcr1,xl,vmdvideo,vmnc,vp3,vp5,vp6,vp6a,vp6f,vp7,vp8,vp9,webp,wmv1,wmv2,wmv3,wmv3image,wnv1,vqavideo,xan_wc3,xan_wc4,xbin,xbm,xface,xwd,y41p,yop,yuv4,zerocodec,zlib,zmbv) do (
echo VIDEO DECODER %%x
%ffmpeg% --help decoder=%%x > %infodir_decoders%\video_%%x.txt
)

for %%x in (8svx_exp,8svx_fib,aac,aac_latm,ac3,ac3_fixed,adpcm_4xm,adpcm_adx,adpcm_afc,adpcm_ct,adpcm_dtk,adpcm_ea,adpcm_ea_maxis_xa,adpcm_ea_r1,adpcm_ea_r2,adpcm_ea_r3,adpcm_ea_xas,g722,g726,g726le,adpcm_ima_amv,adpcm_ima_apc,adpcm_ima_dk3,adpcm_ima_dk4,adpcm_ima_ea_eacs,adpcm_ima_ea_sead,adpcm_ima_iss,adpcm_ima_oki,adpcm_ima_qt,adpcm_ima_rad,adpcm_ima_smjpeg,adpcm_ima_wav,adpcm_ima_ws,adpcm_ms,adpcm_sbpro_2,adpcm_sbpro_3,adpcm_sbpro_4,adpcm_swf,adpcm_thp,adpcm_vima,vima,adpcm_xa,adpcm_yamaha,alac,amrnb,amrwb,ape,atrac1,atrac3,atrac3plus,on2avc,binkaudio_dct,binkaudio_rdft,bmv_audio,comfortnoise,cook,dsd_lsbf,dsd_lsbf_planar,dsd_msbf,dsd_msbf_planar,dsicinaudio,dca,eac3,evrc,flac,g723_1,g729,gsm,gsm_ms,iac,imc,interplay_dpcm,mace3,mace6,metasound,mlp,mp1,mp1float,mp2,mp2float,mp3,mp3float,mp3adu,mp3adufloat,mp3on4,mp3on4float,als,mpc7,mpc8,nellymoser,opus,paf_audio,pcm_alaw,pcm_bluray,pcm_dvd,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_lxf,pcm_mulaw,pcm_s16be,pcm_s16be_planar,pcm_s16le,pcm_s16le_planar,pcm_s24be,pcm_s24daud,pcm_s24le,pcm_s24le_planar,pcm_s32be,pcm_s32le,pcm_s32le_planar,pcm_s8,pcm_s8_planar,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,pcm_zork,qcelp,qdm2,real_144,real_288,ralf,roq_dpcm,s302m,shorten,sipr,smackaud,sol_dpcm,sonic,tak,truehd,truespeech,tta,twinvq,adpcm_vima,vima,vmdaudio,vorbis,libvorbis,wavesynth,wavpack,ws_snd1,wmalossless,wmapro,wmav1,wmav2,wmavoice,xan_dpcm) do (
echo AUDIO DECODER %%x
%ffmpeg% --help decoder=%%x > %infodir_decoders%\audio_%%x.txt
)

for %%x in (ass,dvbsub,dvdsub,pgssub,jacosub,microdvd,mov_text,mpl2,pjs,realtext,sami,srt,ssa,subrip,subviewer,subviewer1,text,vplayer,webvtt,xsub) do (
echo SUBTITLE DECODER %%x
%ffmpeg% --help decoder=%%x > %infodir_decoders%\subtitle_%%x.txt
)

for %%x in (3g2,3gp,a64,ac3,adts,adx,aiff,alaw,amr,asf,asf_stream,ass,ast,au,avi,avm2,bit,caf,cavsvideo,crc,data,daud,dirac,dnxhd,dts,dv,dvd,eac3,f32be,f32le,f4v,f64be,f64le,ffm,ffmetadata,filmstrip,flac,flv,framecrc,framemd5,g722,g723_1,gif,gxf,h261,h263,h264,hds,hevc,hls,ico,ilbc,image2,image2pipe,ipod,ircam,ismv,ivf,jacosub,latm,lrc,m4v,matroska,md5,microdvd,mjpeg,mkvtimestamp_v2,mlp,mmf,mov,mp2,mp3,mp4,mpeg,mpeg1video,mpeg2video,mpegts,mpjpeg,mulaw,mxf,mxf_d10,null,nut,oga,ogg,oma,opus,psp,rawvideo,rm,roq,rso,rtp,rtsp,s16be,s16le,s24be,s24le,s32be,s32le,s8,sap,sdl,segment,smjpeg,smoothstreaming,sox,spdif,speex,srt,stream_segment,ssegment,svcd,swf,tee,truehd,u16be,u16le,u24be,u24le,u32be,u32le,u8,uncodedframecrc,vc1,vc1test,vcd,vob,voc,w64,wav,webm,webm_dash_manifest,webvtt,wtv,wv,yuv4mpegpipe) do (
echo MUXER %%x
%ffmpeg% --help muxer=%%x > %infodir_muxers%\muxer_%%x.txt
)

for %%x in (4xm,aac,ac3,act,adf,adp,adx,aea,afc,aiff,alaw,alias_pix,amr,anm,apc,ape,aqtitle,asf,ass,ast,au,avi,avr,avs,bethsoftvid,bfi,bin,bink,bit,bmv,boa,brender_pix,brstm,c93,caf,cavsvideo,cdg,cdxl,cine,concat,data,daud,dfa,dirac,dnxhd,dsf,dshow,dsicin,dts,dtshd,dv,dxa,ea,ea_cdata,eac3,epaf,f32be,f32le,f64be,f64le,ffm,ffmetadata,film_cpk,filmstrip,flac,flic,flv,frm,g722,g723_1,g729,gdigrab,gif,gsm,gxf,h261,h263,h264,hevc,hls,applehttp,hnm,ico,idcin,idf,iff,ilbc,image2,image2pipe,ingenient,ipmovie,ircam,iss,iv8,ivf,jacosub,jv,latm,lavfi,live_flv,lmlm4,loas,lrc,lvf,lxf,m4v,matroska,webm,mgsts,microdvd,mjpeg,mlp,mlv,mm,mmf,mov,mp4,m4a,3gp,3g2,mj2,mp3,mpc,mpc8,mpeg,mpegts,mpegtsraw,mpegvideo,mpl2,mpsub,msnwctcp,mtv,mulaw,mv,mvi,mxf,mxg,nc,nistsphere,nsv,nut,nuv,ogg,oma,paf,pjs,pmp,psxstr,pva,pvf,qcp,r3d,rawvideo,realtext,redspark,rl2,rm,roq,rpl,rsd,rso,rtp,rtsp,s16be,s16le,s24be,s24le,s32be,s32le,s8,sami,sap,sbg,sdp,sdr2,shn,siff,sln,smjpeg,smk,smush,sol,sox,spdif,srt,subviewer,subviewer1,swf,tak,tedcaptions,thp,tiertexseq,tmv,truehd,tta,tty,txd,u16be,u16le,u24be,u24le,u32be,u32le,u8,vc1,vc1test,vfwcap,vivo,vmd,vobsub,voc,vplayer,vqf,w64,wav,wc3movie,webm_dash_manifest,webvtt,wsaud,wsvqa,wtv,wv,xa,xbin,xmv,xwma,yop,yuv4mpegpipe) do (
echo DEMUXER %%x
%ffmpeg% --help demuxer=%%x > %infodir_demuxers%\demuxer_%%x.txt
)
