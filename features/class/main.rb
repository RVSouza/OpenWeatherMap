# frozen_string_literal: true

# Main class with common methods that can be used on other classes
class MainClass
  def base_url
    change_word(URL['base'], DATA['api_key'])
  end

  def change_word(word, *new_word)
    new_word.each_index do |index|
      word = word.sub "{#{index}}", new_word[index].to_s
    end
    word
  end

  def add_parameter(endpoint, new_parameter)
    new_parameter = URI.encode_www_form_component(new_parameter)
    change_word(endpoint, new_parameter)
  end

  def add_optional_parameters(url, optionals)
    optionals.each_index do |index|
      case optionals[index]
      when 'lang'
        url += add_parameter(ENDPOINTS['optional']['lang'], optionals[index + 1])
      when 'mode'
        url += add_parameter(ENDPOINTS['optional']['mode'], optionals[index + 1])
      when 'units'
        url += add_parameter(ENDPOINTS['optional']['units'], optionals[index + 1])
      end
    end
    url
  end
end
