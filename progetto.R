# Definisci i valori per time_window
#time_windows <- c(80, 90, 100)
#time_windows <- c(200, 250, 300) #per più esperimenti
time_windows <- c(20, 10, 5) #per più esperimenti

# Lista per salvare i risultati
result_list <- list()

# Ciclo sui valori di time_window
for(tw in time_windows){
  # Esegui 10 repliche per ciascun time_window
  for(i in 1:10){
    res <- simulate_data(approx_size = 200,
                         n_accounts_coord = 100,
                         n_accounts_noncoord = 100,
                         n_objects = 5,
                         min_participation = 3,
                         time_window = tw,
                         lambda_coord = NULL,
                         lambda_noncoord = NULL)
    # Aggiungi il risultato alla lista
    df <- as.data.frame(res[[2]])
    result_list[[length(result_list) + 1]] <- df
  }
}

# Concatena tutti i risultati in un unico data frame o data.table
final_result <- do.call(rbind, result_list)

#scrittura su disco
write.csv(final_result,"dataset_test_20_10_5.csv", row.names = FALSE)

# Visualizza il risultato finale
print(final_result)
