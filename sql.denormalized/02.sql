SELECT tag, count(*) AS count
FROM (
    SELECT distinct data->>'id' AS id_tweets, '#' || (jsonb_array_elements(data->'entities'->'hashtags' || coalesce(data->'extended_tweet'->'entities'->'hashtags','[]'))->>'text') AS tag
    FROM tweets_jsonb
    WHERE data ->'entities'->'hashtags' @@ '$[*].text == "coronavirus"' OR data->'extended_tweet'->'entities'->'hashtags' @@ '$[*].text == "coronavirus"'
) t1
GROUP BY tag
ORDER BY count DESC, tag
LIMIT 1000;
