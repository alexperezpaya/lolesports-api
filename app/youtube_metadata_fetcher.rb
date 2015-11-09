class YoutubeMetadataFetcher
  def initialize(video_id)
    @raw_metadata = RestClient.get "http://www.youtube.com/get_video_info?video_id=#{video_id}"
    @metadata = YoutubeParser.parse_string(@raw_metadata)
  end

  def metadata
    @metadata
  end
end

class YoutubeParser
  def self.parse_string(string)
    youtube_string = string
    youtube_info_array = youtube_string.split '&'
    raise "Failed" if youtube_info_array.first == 'status=fail'

    format_stream_array_string = youtube_info_array.find { |element|
      element.split('=').first == 'url_encoded_fmt_stream_map'
    }.split('=')[1]
    format_stream_array = URI.decode(format_stream_array_string).split(',')

    formats = []
    format_stream_array.each { |format_stream_string|
      format_info_array = format_stream_string.split '&'
      info_hash = {}
      format_info_array.each do |format_info_element|
        format_info_element_pair = format_info_element.split '='
        info_hash[format_info_element_pair[0]] = URI.decode(format_info_element_pair[1])
      end
      formats << info_hash
    }
    formats.map { |f|
      f.each do |key, value|
        f[key] = URI.decode(value)
      end
    }
    formats
  end
end
