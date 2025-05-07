SELECT count(distinct data->>'id')
FROM tweets_jsonb
WHERE to_tsvector('english',coalesce(data->'extended_tweet'->>'full_text',data->>'text')) @@ to_tsquery('english','coronavirus') AND data->>'lang' = 'en';
