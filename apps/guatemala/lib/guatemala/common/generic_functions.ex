defmodule Guatemala.GenericFunctions do

  # @perdida 4
  # @cancelada 5

  # @lada_corta 1

  @doc """
  Validate crossbones service and return a boolean.

  ## Examples

    iex> Guatemala.GenericFunctions.check_crossbones(1)
      true

    iex> Guatemala.GenericFunctions.check_crossbones(1)
      false

  """
  # def check_crossbones(user_id) do
  #   user_id
  #     |> Guatemala.Crossbones.get_user_employee_by_user_id
  #     |> case do
  #       {:error, :econnrefused} ->
  #         [false, "Sin Conexión"]
  #       {:error, reason} ->
  #         [false, reason]
  #       _ ->
  #         [true, nil]
  #     end
  # end

  @doc """
  Validate empty spaces of a string list and return a boolean.

  ## Examples

    datas = ["data", "other_data"]
    iex> Guatemala.GenericFunctions.string_listing_validation(datas, true)
      true

    datas = ["", "other_data"]
    iex> Guatemala.GenericFunctions.string_listing_validation(datas, true)
      false

  """
  def string_listing_validation([h|t], valid) do
    string_listing_validation(t, valid && (h |> valid_string_data()))
  end

  def string_listing_validation([], valid) do
    valid
  end

  @doc """
  Function like before but a "OR" condition

  ## Examples

    datas = ["data", "other_data"]
    iex> Guatemala.GenericFunctions.valid_string_with_or(datas, true)
      true

    datas = ["", "other_data"]
    iex> Guatemala.GenericFunctions.valid_string_with_or(datas, true)
      false

  """

  def valid_string_with_or([h|t], valid) do
    valid_string_with_or(t, valid || (h |> valid_string_data()))
  end

  def valid_string_with_or([], valid) do
    valid
  end

  @doc """
  Validates if a string is empty and returns a boolean.

  ## Examples

    iex> Guatemala.GenericFunctions.valid_string_data("Hola")
      true

    iex> Guatemala.GenericFunctions.valid_string_data("")
      false

    iex> Guatemala.GenericFunctions.valid_string_data(nil)
      false

  """
  def valid_string_data(nil), do: false
  def valid_string_data(string_data), do: !String.equivalent?(string_data |> String.trim, "")

  @doc """
  Receives a numeric value as a string and transforms it to float.
  PD. this can receive a currency format string and return a float value

  ## Examples

    iex> Guatemala.GenericFunctions.convert_string_number_to_float("500")
      500.0

    iex> Guatemala.GenericFunctions.convert_string_number_to_float("500.70")
      500.7

    iex> Guatemala.GenericFunctions.convert_string_number_to_float("$457,542,500,452.54")
      457542500452.54

    iex> Guatemala.GenericFunctions.convert_string_number_to_float("")
      0.0

    iex> Guatemala.GenericFunctions.convert_string_number_to_float(nil)
      0.0

  """
  def convert_string_number_to_float(float_value) do
    value = float_value
    try do
      value
      |> String.contains?(".")
      |> case do
        true ->
          value |> String.to_float
        false ->
          (value |> String.to_integer) / 1
      end
    rescue
      ArgumentError ->
        value
          |> String.starts_with?("$")
          |> case do
            true ->
              value |> String.split(["$", ","]) |> Enum.join |> String.to_float
            false ->
              0.0
          end
      FunctionClauseError ->
        0.0
    end
  end

  @doc """
  Returns only the records with the value of active as true.

  ## Examples

    datas = [%{name: "data", active: true}, %{name: "other data", active: true}, %{name: "other data false", active: false}]

    iex> Guatemala.GenericFunctions.filter_only_active(datas)
      [%{name: "data", active: true}, %{name: "other data", active: true}]

  """
  def filter_only_active(list) do
    list |> Enum.filter(fn x -> x.active == true end)
  end

  @doc """
  Returns date format from string date, if input a invalid date format return date today

  ## Examples

    iex> Guatemala.GenericFunctions.date_format("2021-10-21")
      ~D[2021-10-21]

    iex> Guatemala.GenericFunctions.date_format("")
      ~D[2021-10-21]

  """
  def date_format(date) do
    try do
      date |> Date.from_iso8601!()
    rescue
      ArgumentError ->
        Date.utc_today
    end
  end

  @doc """
  Returns date format from naive_datetime.

  ## Examples

    iex> Guatemala.GenericFunctions.naive_datetime_to_date(~N[2021-05-10 05:11:41])
      ~D[2021-05-10]

    iex> Guatemala.GenericFunctions.naive_datetime_to_date("2021-05-28")
      "2021-05-28"

  """
  def naive_datetime_to_date(naive_datetime) do
    naive_datetime
    |> is_bitstring
    |> case do
      true ->
        naive_datetime
      false ->
        naive_datetime
        |> NaiveDateTime.to_string
        |> String.split
        |> List.first
        |> date_format()
    end
  end

  @doc """
  Returns naive_datetime from a valid date string with the local hour.

  ## Examples

    iex> Guatemala.GenericFunctions.date_string_to_naive_datetime("2021-05-18")
      ~N[2021-05-18 22:51:53.000]

  """

  def date_string_to_naive_datetime(date_string) do
    (date_string
    <> "T"
    <> (NaiveDateTime.local_now()
        |> NaiveDateTime.to_string
        |> String.split
        |> List.last)
        <> ".000Z")
        |> NaiveDateTime.from_iso8601!
  end

  @doc """
  Validate the empty spaces of a list of string maps and return a list of maps with the key and a boolean depending on its validation.

  ## Examples

    datas = [%{serial: ""}, %{number: "54"}, %{name: "si trae nombre"}]
    iex> Guatemala.GenericFunctions.map_string_listing_validation(datas, [])
      [{"name", true}, {"number", true}, {"serial", false}]

  """

  def map_string_listing_validation([h|t], list) do
    map_string_listing_validation(t, [build_map(h)] ++ list)
  end

  def map_string_listing_validation([], list) do
    list |> List.flatten
  end

  def build_map(h) do
    h |> Enum.map(fn {key, value} -> {key |> Atom.to_string, value |> valid_string_data()} end)
  end

  @doc """
  Validate the empty spaces of a list of string maps and return a list of maps with the key and a boolean depending on its validation.

  ## Examples

    datas = [%{serial: ""}, %{number: "54"}, %{name: "si trae nombre"}]
    iex> Guatemala.GenericFunctions.map_string_listing_validation_v2(datas, [])
       [%{name: false}, %{number: true}, %{serial: false}]

  """

  def map_string_listing_validation_v2([h|t], list) do
    map_string_listing_validation_v2(t, [build_map_v2(h)] ++ list)
  end

  def map_string_listing_validation_v2([], list) do
    list |> List.flatten
  end

  def build_map_v2(h) do
    h |> Enum.map(fn {key, value} -> Map.new([{key, (value |> valid_string_data())}]) end)
  end

  @doc """
  Validate the empty spaces of a list of string maps and return a map with the key and a boolean depending on its validation.

  ## Examples

    datas = [%{serial: ""}, %{number: "54"}, %{name: "si trae nombre"}]
    iex> Guatemala.GenericFunctions.map_string_listing_validation_v3(datas, %{})
       %{name: true, number: true, serial: false}

  """
  def map_string_listing_validation_v3([h|t], map) do
    map_string_listing_validation_v3(t, build_map_v3(h, map))
  end

  def map_string_listing_validation_v3([], map) do
    map
  end

  def build_map_v3(h, map) do
    h |> Enum.map(fn {key, value} -> map |> Map.put(key, value |> valid_string_data()) end) |> List.first
  end

  @doc """
  Return a round float number with two decimals from a integer or float number

  ## Examples

    iex> Guatemala.GenericFunctions.roundx(585)
       585.0

    iex> Guatemala.GenericFunctions.roundx(5855.4541)
       5855.45

  """
  def roundx(val) when is_float(val), do: Float.round(val, 2)
  def roundx(val) when is_integer(val), do: Float.round(val / 1, 2)

  @doc """
    Converts the first character in the given string to uppercase and the remainder to lowercase

    ##Examples

      iex> Guatemala.GenericFunctions.titelize("text")
        "Text"
  """
  def titelize(text) do
    text
      |> String.capitalize()
  end

  @doc """
    Converts the text to lowercase, in case of nil or empty string, returns empty string

    ##Examples

      iex> Guatemala.GenericFunctions.downcase("TeXt")
        "text"

      iex> Guatemala.GenericFunctions.downcase(nil)
        ""
  """
  def downcase(nil), do: ""
  def downcase(""), do: ""
  def downcase(text), do: text |> String.downcase()

  @doc """
  Return a date time as string with format dd/mm/yyyy hh:mm:ss from a naive_datetime value

  ## Examples

    iex> Guatemala.GenericFunctions.naive_datetime_to_string_format(~N[2021-05-20 18:17:54])
       "20/5/2021 18:17:54"

  """

  def naive_datetime_to_string_format(naive) do
    hours = naive |> NaiveDateTime.to_string() |> String.split() |> List.last
    ([add_zero(Integer.to_string(naive.day), 2), add_zero(Integer.to_string(naive.month), 2), naive.year] |> Enum.join("/")) <> " " <> hours
  end

  @doc """
  Return a date time as string with format dd/mm/yyyy hh:mm:ss from a naive_datetime value

  ## Examples

    iex> Guatemala.GenericFunctions.naive_datetime_to_string_format_with_reverse(~N[2021-05-20 18:17:54])
       "18:17:54 20/5/2021"

  """
  def naive_datetime_to_string_format_with_reverse(naive) do
    naive
      |> naive_datetime_to_string_format()
      |> String.split
      |> reverse_this()
  end

  def reverse_this([h|t]) do
    (t |> List.first) <> " " <> h
  end

  @doc """
  Return a boolean from a string boolean value

  ## Examples

    iex> Guatemala.GenericFunctions.string_to_bool("true")
       true

    iex> Guatemala.GenericFunctions.string_to_bool("false")
       false

    iex> Guatemala.GenericFunctions.string_to_bool("x")
       false

  """
  def string_to_bool(text), do: text == "true"

  def float_to_text_long(float), do: float |> :erlang.float_to_binary([decimals: 2])

  @doc """
  Return a string with currency format from a float o integer value

  ## Examples

    iex> Guatemala.GenericFunctions.number_to_currency(50000)
       "$50,000.00"

    iex> Guatemala.GenericFunctions.number_to_currency(1856.46)
       "$1,856.46"

    iex> Guatemala.GenericFunctions.number_to_currency(nil)
       "$0.00"

    iex> Guatemala.GenericFunctions.number_to_currency("")
       "$0.00"

  """
  # def number_to_currency(nil), do: "$0.00"

  # def number_to_currency(value) do
  #   try do
  #     value |> Number.Currency.number_to_currency
  #   rescue
  #     Decimal.Error ->
  #       "$0.00"
  #   end
  # end

  @doc """
  Returns a Boolean value when comparing two dates, where date 1 is less than or equal to date 2

  ## Examples

    iex> Guatemala.GenericFunctions.compare_dates(~D[2021-05-20], ~D[2021-05-30])
       true

    iex> Guatemala.GenericFunctions.compare_dates(~D[2021-05-20], ~D[2021-05-20])
       true

    iex> Guatemala.GenericFunctions.compare_dates(~D[2021-05-30], ~D[2021-05-20])
       false

  """
  def compare_dates(date1, date2) do
    Date.compare(date1, date2)
    |> case do
      :lt -> true
      :eq -> true
      :gt -> false
    end
  end

  @doc """
  Returns a string for the months or days that need a zero prepended

  ## Examples

    iex> Guatemala.GenericFunctions.add_zero("2", 2)
       "02"

    iex> Guatemala.GenericFunctions.add_zero("12", 2)
       "12"

    iex> Guatemala.GenericFunctions.add_zero("012", 2)
       ** (RuntimeError) Configuraci├│n incorrecta, favor de revisar

  """
  def add_zero(str, len) do
    size = String.length(str)
    if len - size < 0, do: raise RuntimeError, message: "Configuración incorrecta, favor de revisar"
    String.duplicate("0", len - size) <> str
  end


  def now_but_mexican() do
    {_, date} = DateTime.now("America/Mexico_City", Tzdata.TimeZoneDatabase)
    date
      |> DateTime.to_naive()
  end

  @doc """
  Returns a string sentence with capitalize word from a string sentence

  ## Examples
    iex> Guatemala.GenericFunctions.titelize_sentence("DIEGO SALINAS ESCOBAR")
       "Diego Salinas Escobar"

  """
  def titelize_sentence(nil) do
    ""
  end
  def titelize_sentence(sentence) do
    sentence
      |> String.split
      |> build_list_sentence("")
  end

  defp build_list_sentence([h|t], sentence) do
    build_list_sentence(t, sentence <> " " <> (h |> titelize))
  end

  defp build_list_sentence([], sentence) do
    sentence |> String.trim
  end

  @doc """
  Returns a naive datetime local with minus 6 hours from naive datetime

  ## Examples
    iex> Guatemala.GenericFunctions.to_mexico_city(~N[2021-05-20 18:17:54])
       ~N[2021-05-20 13:17:54]

  """

  def to_mexico_city(naive_datetime) do
    DateTime.from_naive!(naive_datetime, "Etc/UTC")
      |> DateTime.shift_zone!("America/Mexico_City")
      |> DateTime.to_naive
  end

  @doc """
  returns a naive datetime from a input´s type datetime local from front interface

  ## Examples
    iex> Guatemala.GenericFunctions.convert_to_naive("2021-06-19T09:44")
       ~N[2021-06-19 09:44:00]

    iex> Guatemala.GenericFunctions.convert_to_naive("")
       ""

  """
  def convert_to_naive(datetime) do
    datetime
      |> valid_string_data
      |> case do
        true ->
          datetime
            |> String.ends_with?("Z")
              |> case do
                true ->
                  datetime |> NaiveDateTime.from_iso8601!()
                false ->
                  datetime <> ":00Z" |> NaiveDateTime.from_iso8601!()
              end
        false ->
          ""
      end
  end

  @doc """
  returns a boolean from compares twos naive_datetime with hours where start_date < end_date

  ## Examples
    iex> Guatemala.GenericFunctions.compare_naive_datetime(~N[2021-06-18 12:30:00], ~N[2021-06-18 13:30:00])
       true

    iex> Guatemala.GenericFunctions.compare_naive_datetime(~N[2021-06-18 13:30:00], ~N[2021-06-18 13:30:00])
       false

    iex> Guatemala.GenericFunctions.compare_naive_datetime(~N[2021-06-18 14:30:00], ~N[2021-06-18 13:30:00])
       false

  """
  def compare_naive_datetime(naive_datetime1, naive_datetime2) do
    NaiveDateTime.compare(naive_datetime1, naive_datetime2)
    |> case do
      :lt -> true
      :eq -> false
      :gt -> false
    end
  end

  @doc """
  returns a datetime format for input datetime-local (for read in front interface) from naive_datetime

  ## Examples
    iex> Guatemala.GenericFunctions.to_datetime_local_input(~N[2021-06-18 14:30:00])
       "2021-06-18T14:30"

  """
  def to_datetime_local_input(naive_datetime) do
    naive_datetime
      |> NaiveDateTime.to_string
      |> String.split
      |> build
  end

  defp build([h|t]) do
    h <> "T" <> (t |> List.first |> String.slice(0..4))
  end

  @doc """
  returns a datetime iso format from naive_datetime with 6 hours add (this for send mail)

  ## Examples
    iex> Guatemala.GenericFunctions.naive_datetime_to_calendar(~N[2021-06-18 14:30:00])
       "2021-06-18T19:30:00Z"

  """

  def naive_datetime_to_calendar(date_info) do
    {:ok, date_mex} = (date_info) |> DateTime.from_naive("America/Mexico_City")

    {:ok, date_utc} = date_info |> DateTime.from_naive("Etc/UTC")

    dif = DateTime.diff(date_utc, date_mex, :second)

    {:ok, date_info} = date_info |> NaiveDateTime.add((dif * -1), :second) |> DateTime.from_naive("Etc/UTC")

    (date_info |> NaiveDateTime.to_iso8601) <> "Z"

  end

  @doc """
  returns a datetime iso format from naive_datetime with 6 hours less (this for send mail)

  ## Examples
    iex> Guatemala.GenericFunctions.naive_datetime_to_calendar_2(~N[2021-06-18 14:30:00])
       "2021-06-18T19:30:00Z"

  """
  def naive_datetime_to_calendar_2(date_info) do
    {:ok, date_mex} = (date_info) |> DateTime.from_naive("America/Mexico_City")

    {:ok, date_utc} = date_info |> DateTime.from_naive("Etc/UTC")

    dif = DateTime.diff(date_utc, date_mex, :second)

    {:ok, date_info} = date_info |> NaiveDateTime.add((dif * 1), :second) |> DateTime.from_naive("Etc/UTC")

    (date_info |> NaiveDateTime.to_iso8601) <> "Z"

  end

  @doc """
  returns a boolean from validate email format

  ## Examples
    iex> Guatemala.GenericFunctions.email("bla@hotmail.com")
      true

    iex> Guatemala.GenericFunctions.email("asdfasfasdf")
      false

    iex> Guatemala.GenericFunctions.email(nil)
      false

  """
  def email(nil), do: false
  def email(email) do
    try do
      ~r/^[\w.!#$%&’*+\-\/=?\^`{|}~]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*$/i
        |> Regex.run(email)
        |> case do
          nil -> false
          value -> value |> length > 1
        end
    rescue
      FunctionClauseError -> false
    end
  end

  @doc """
  returns a boolean from validate required data

  ## Examples
    iex> Guatemala.GenericFunctions.required("data")
      true

    iex> Guatemala.GenericFunctions.required("")
      false

    iex> Guatemala.GenericFunctions.required(nil)
      false

  """
  def required(nil), do: false
  def required(""), do: false
  def required(_any), do: true

  @doc """
  returns a boolean from validate string length to 10

  ## Examples
    iex> Guatemala.GenericFunctions.length_10("0123456789")
      true

    iex> Guatemala.GenericFunctions.length_10("012345")
      false

  """
  def length_10(value), do: value |> String.length() == 10

  @doc """
  returns a boolean from validate string is number with regular expression

  ## Examples
    iex> Guatemala.GenericFunctions.only_number("0123456789")
      true

    iex> Guatemala.GenericFunctions.only_number("aaaa")
      false

  """
  def only_number(value), do: value |> String.match?(~r/^[0-9]*$/)

  @doc """
  returns a boolean from validate string start with like lada number

  ## Examples
    iex> Guatemala.GenericFunctions.lada("283")
      true

    iex> Guatemala.GenericFunctions.lada("666")
      false

  """
  def lada(tel) do
    tel
      |> String.starts_with?(arr_lada())
  end

  @doc """
  returns rules from validation in catalogue form

  """
  def validate_form(rules, target, value) do
    rule =
      rules
      |> Map.get(target |> String.to_atom())
      |> Map.put(:valid, true)

    result =
      rule
      |> validate("", value)

    rules =
      rules
      |> Map.put(
        target |> String.to_atom(),
        rule
        |> Map.put(:valid, result.valid)
        |> Map.put(:message, result.message)
      )

    rules
  end

  @doc """
  returns rules from validation in catalogue form

  """
  def validate(rule = %{required: [func | others], valid: valid}, message, value) do
    new_valid = func.func.(value)

    rule =
      rule
      |> Map.put(:required, others)
      |> Map.put(:valid?, new_valid && valid)

    message =
      case new_valid do
        true -> message
        false -> func.message
      end

    validate(rule, message, value)
  end

  def validate(rule = %{required: [], valid: valid}, message, _value),
    do: %{valid: valid, message: message}

  # @doc """
  # returns rules from validation in catalogue form

  # """
  def validate_all_form([{atom, value} | others], valid) do
    validate_all_form(others, value.valid && valid)
  end

  def validate_all_form([], valid), do: valid

  @doc """
  returns only numbers string from a phone number format

  """
  # def reverse_format(nil), do: ""
  # def reverse_format(""), do: ""
  # def reverse_format(phone) do
  #   contain = phone
  #     |> String.slice(1..2)
  #     |> String.contains?(ladas_cortas())
  #   if contain do
  #     "#{String.slice(phone, 1..2)}#{String.slice(phone, 5..8)}#{String.slice(phone, 10..13)}"
  #   else
  #     "#{String.slice(phone, 1..3)}#{String.slice(phone, 6..8)}#{String.slice(phone, 10..13)}"
  #   end
  # end

  @doc """
  returns format phone numbers string from a phone number format

  #Examples
    iex> Guatemala.GenericFunctions.format_phone("5527220409")
      "(55) 2722-0409"

  """
  def format_phone(phone) do
    if String.length(phone) == 10 do
      contain = phone
        |> String.slice(0..1)
        |> String.contains?(ladas_cortas())
      if contain do
        "(#{String.slice(phone, 0..1)}) #{String.slice(phone, 2..5)}-#{String.slice(phone, 6..9)}"
      else
        "(#{String.slice(phone, 0..2)}) #{String.slice(phone, 3..5)}-#{String.slice(phone, 6..9)}"
      end
    else
      phone
    end
  end

  def map_to_uppercase(map) do
    map
      |> Enum.map(fn {key, value} -> uppercase(key, value) end)
      |> Map.new()
  end

  defp uppercase(key, value) when is_bitstring(value), do: {key, value |> String.upcase()}
  defp uppercase(key, value), do: {key, value}

  def map_trim(map) do
    map
      |> Enum.map(fn {key, value} -> trim(key, value) end)
      |> Map.new()
  end

  defp trim(key, value) when is_bitstring(value), do: {key, value |> String.trim()}
  defp trim(key, value), do: {key, value}

  def list_to_uppercase(list) do
    list
      |> Enum.map(fn data -> data |> try_upcase() end)
  end

  defp try_upcase(text) when is_bitstring(text), do: text |> String.upcase()
  defp try_upcase(text), do: text

  @doc """
  Validate status from opportunity if status is lost or cancel and return boolean value

  ## Examples

    iex> Guatemala.GenericFunctions.can_edit_from_status(1)
      true

    iex> Guatemala.GenericFunctions.can_edit_from_status(5)
      false

  """
  # # def can_edit_from_status(status) do
  # //   !(status == @perdida or status == @cancelada)
  # # end

  def add_hours_naive_datetime(nil), do: nil
  def add_hours_naive_datetime(""), do: ""
  def add_hours_naive_datetime(naive_datetime) do
    {:ok, mex} = naive_datetime |> DateTime.from_naive("America/Mexico_City")
    {:ok, utc} = naive_datetime |> DateTime.from_naive("Etc/UTC")
    dif = DateTime.diff(utc, mex, :second)
    naive_datetime
      |> NaiveDateTime.add((dif * 1), :second)
  end

  @doc """
  Return the local naive_datetime if the arriving time parameter is different from the time zone of Mexico City in hours used for server data naive_datetime
  USE ONLY WITH DATES

  ## Examples

    iex> Guatemala.GenericFunctions.put_local_time_mex(~N[2021-10-02 02:45:10])
      ~N[2021-10-01 16:45:10]

    iex> Guatemala.GenericFunctions.put_local_time_mex(nil)
      nil

    iex> Guatemala.GenericFunctions.put_local_time_mex("")
      ""

  """
  def put_local_time_mex(nil), do: nil
  def put_local_time_mex(""), do: ""
  def put_local_time_mex(naive_datetime) do
    mex = DateTime.utc_now() |> DateTime.shift_zone!("America/Mexico_City") |> DateTime.to_naive
    (naive_datetime |> NaiveDateTime.to_time != mex |> NaiveDateTime.to_time)
      |> case do
        true ->
          naive_datetime
            |> NaiveDateTime.add(-((naive_datetime.hour - mex.hour) * 3600), :second)
        false ->
          naive_datetime
      end
  end

  def string_map_to_atom(map) do
    map
      |> Map.new(
        fn {key, value} -> {any_to_atom(key), value} end
      )
  end

  defp any_to_atom(string) when is_bitstring(string), do: string |> String.to_atom()
  defp any_to_atom(string) when is_atom(string), do: string
  defp any_to_atom(_), do: :not_string_or_atom

  def ladas_cortas() do
    [
      "33",
      "55",
      "56",
      "81"
    ]
  end

  defp arr_lada() do
    [
      "33",
      "56",
      "55",
      "81",
      "222",
      "223",
      "224",
      "225",
      "226",
      "227",
      "228",
      "229",
      "231",
      "232",
      "233",
      "235",
      "236",
      "237",
      "238",
      "241",
      "243",
      "244",
      "245",
      "246",
      "247",
      "248",
      "249",
      "271",
      "272",
      "273",
      "274",
      "275",
      "276",
      "278",
      "279",
      "281",
      "282",
      "283",
      "284",
      "285",
      "287",
      "288",
      "294",
      "296",
      "297",
      "311",
      "312",
      "313",
      "314",
      "315",
      "316",
      "317",
      "319",
      "321",
      "322",
      "323",
      "324",
      "325",
      "326",
      "327",
      "328",
      "329",
      "341",
      "342",
      "343",
      "344",
      "345",
      "346",
      "347",
      "348",
      "349",
      "351",
      "352",
      "353",
      "354",
      "355",
      "356",
      "357",
      "358",
      "359",
      "371",
      "372",
      "373",
      "374",
      "375",
      "376",
      "377",
      "378",
      "381",
      "382",
      "383",
      "384",
      "385",
      "386",
      "387",
      "388",
      "389",
      "391",
      "392",
      "393",
      "394",
      "395",
      "411",
      "412",
      "413",
      "414",
      "415",
      "417",
      "418",
      "419",
      "421",
      "422",
      "423",
      "424",
      "425",
      "426",
      "427",
      "428",
      "429",
      "431",
      "432",
      "433",
      "434",
      "435",
      "436",
      "437",
      "438",
      "441",
      "442",
      "443",
      "444",
      "445",
      "447",
      "448",
      "449",
      "451",
      "452",
      "453",
      "454",
      "455",
      "456",
      "457",
      "458",
      "459",
      "461",
      "462",
      "463",
      "464",
      "465",
      "466",
      "467",
      "468",
      "469",
      "471",
      "472",
      "473",
      "474",
      "475",
      "476",
      "477",
      "478",
      "481",
      "482",
      "483",
      "485",
      "486",
      "487",
      "488",
      "489",
      "492",
      "493",
      "494",
      "495",
      "496",
      "498",
      "499",
      "588",
      "591",
      "592",
      "593",
      "594",
      "595",
      "596",
      "597",
      "599",
      "612",
      "613",
      "614",
      "615",
      "616",
      "618",
      "621",
      "622",
      "623",
      "624",
      "625",
      "626",
      "627",
      "628",
      "629",
      "631",
      "632",
      "633",
      "634",
      "635",
      "636",
      "637",
      "638",
      "639",
      "641",
      "642",
      "643",
      "644",
      "645",
      "646",
      "647",
      "648",
      "649",
      "651",
      "652",
      "653",
      "656",
      "658",
      "659",
      "661",
      "662",
      "664",
      "665",
      "667",
      "668",
      "669",
      "671",
      "672",
      "673",
      "674",
      "675",
      "676",
      "677",
      "686",
      "687",
      "694",
      "695",
      "696",
      "697",
      "698",
      "711",
      "712",
      "713",
      "714",
      "715",
      "716",
      "717",
      "718",
      "719",
      "721",
      "722",
      "723",
      "724",
      "725",
      "726",
      "727",
      "728",
      "731",
      "732",
      "733",
      "734",
      "735",
      "736",
      "737",
      "738",
      "739",
      "741",
      "742",
      "743",
      "744",
      "745",
      "746",
      "747",
      "748",
      "749",
      "751",
      "753",
      "754",
      "755",
      "756",
      "757",
      "758",
      "759",
      "761",
      "762",
      "763",
      "764",
      "765",
      "766",
      "767",
      "768",
      "769",
      "771",
      "772",
      "773",
      "774",
      "775",
      "776",
      "777",
      "778",
      "779",
      "781",
      "782",
      "783",
      "784",
      "785",
      "786",
      "789",
      "791",
      "797",
      "821",
      "823",
      "824",
      "825",
      "826",
      "828",
      "829",
      "831",
      "832",
      "833",
      "834",
      "835",
      "836",
      "841",
      "842",
      "844",
      "845",
      "846",
      "861",
      "862",
      "864",
      "866",
      "867",
      "868",
      "869",
      "871",
      "872",
      "873",
      "877",
      "878",
      "891",
      "892",
      "894",
      "897",
      "899",
      "913",
      "914",
      "916",
      "917",
      "918",
      "919",
      "921",
      "922",
      "923",
      "924",
      "932",
      "933",
      "934",
      "936",
      "937",
      "938",
      "951",
      "953",
      "954",
      "958",
      "961",
      "962",
      "963",
      "964",
      "965",
      "966",
      "967",
      "968",
      "969",
      "971",
      "972",
      "981",
      "982",
      "983",
      "985",
      "986",
      "988",
      "991",
      "992",
      "993",
      "994",
      "995",
      "996",
      "997",
      "998",
      "999",
      "984",
      "987"
    ]
  end

  # def insert_snet_list_quotes_opportunities([]) do
  #   []
  # end

  # def insert_snet_list_quotes_opportunities(list) do
  #   Map.new
  #     |> Map.put(:action, 1)
  #     |> Map.put(:list, list)
  #     |> Guatemala.Crossbones.quote_opportunity()
  # end


  @doc """
  Return list with filters applied, this need a list, atom in list for search and param's value to filter

  ## Examples
    list = [
      %{active: false, id: 1, name: "Juan"},
      %{active: true, id: 2, name: "Antonio"},
      %{active: false, id: 3, name: "Pablo"},
      %{active: true, id: 4, name: "Daniel"},
      %{active: false, id: 5, name: "Juan"}
    ]
    iex> Guatemala.GenericFunctions.apply_filter(list, :name, "Juan")
      [%{active: false, id: 1, name: "Juan"}, %{active: false, id: 5, name: "Juan"}]

    iex> Guatemala.GenericFunctions.apply_filter(list, :name, "Victor")
      []

    iex> Guatemala.GenericFunctions.apply_filter(list, :name, nil)
      []

  """
  def apply_filter(list, atom, value) do
    list |> Enum.filter(fn x -> x |> Map.get(atom) == value end)
  end

  def get_data_phone_number(phone) do
    phone
      |> String.starts_with?(ladas_cortas())
      |> case do
        true ->
          %{
            lada: phone |> String.slice(0..1),
            number: phone |> String.slice(2..9)
          }
        false ->
          %{
            lada: phone |> String.slice(0..2),
            number: phone |> String.slice(3..9)
          }
      end
  end

  def is_same_data(value_1, value_2), do: value_1 == value_2

end
