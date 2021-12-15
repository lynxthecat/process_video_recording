# process_video_recording
Windows batch script to extract and encode video segment based on start and end times of video recording from a set of video files such as those produced by GoPro devices and similar. The output is a single encoded file. 

Designed for use in the following way:

* Create parent recording directory
* Create video processing directory inside parent recording directory*
* Place this script inside the video processing directory
* Copy video files needing processing into the video processing directory
* Execute the script

The script firstly combines the set of video files into a single video - an intermediate video. This video can then be manually opened to ascertain start and end times of desired video segment for extraction and processing. 

Once the script has created the intermediate video, the script requests the following inputs:

* start time (start of video segment to extract)
* end time (end of video segment to extract)
* recording date (date of recording)

The script then extracts and encodes the video segment and once completed places the extracted video segment in the parent recording directory, creates a folder with the recording date in the parent recording directory, and places the original video files into that folder with the recording date. 

*Multiple processing directories (e.g. Primary Queue, Secondary Queue, etc.) can be conveniently created for parallel processing of multiple sets of video files at once. In this case, one copy of the script should be placed inside each of processing directory.  
