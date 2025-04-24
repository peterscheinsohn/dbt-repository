SELECT 
  mcc.movie_id,
  mcc.movie_title,
  mcc.genre,
  mcc.studio,
  njc.month,
  njc.location,
  i.invoice_sum AS rental_cost,
  njc.tickets_sold,
  njc.revenue

FROM 
  {{  ref('movie_catalogue_clean') }} AS mcc

LEFT JOIN 
  {{  ref('nj_cinemas') }} AS njc
  ON mcc.movie_id=njc.movie_id
  
LEFT JOIN
  {{ source('invoices_corrected', 'invoices_corrected') }} AS i
   ON mcc.movie_id=i.movie_id