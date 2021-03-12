package com.example.demo_ess;

import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.zip.GZIPInputStream;
import java.util.Scanner;


public class APIManager {
    public String getESGStats(String ticker) throws IOException{
        URL urlForGetRequest = new URL("https://esg-environmental-social-governance-data.p.rapidapi.com/search?q=" + ticker);
        String readLine = null;
        HttpURLConnection connection = (HttpURLConnection)  urlForGetRequest.openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("x-rapidapi-key", "9a1481d7c2msh108a954e62cd3aap18333ajsn28287b15539c");
        connection.setRequestProperty("x-rapidapi-host", "esg-environmental-social-governance-data.p.rapidapi.com");


        int responseCode = connection.getResponseCode();


        if (responseCode == HttpURLConnection.HTTP_OK){
            BufferedReader in = new BufferedReader(new InputStreamReader(new GZIPInputStream(connection.getInputStream())));
            StringBuffer response = new StringBuffer();
            while ((readLine = in.readLine()) != null) {
                response.append(readLine);
            }
            in.close();
            return response.toString();
        }
        else{
            return "GET NOT WORKED";
        }
    }
    public String getStockPrice(String ticker) throws IOException{
        URL urlForGetRequest = new URL("https://stock-price4.p.rapidapi.com/price/" + ticker);
        String readLine = null;
        HttpURLConnection connection = (HttpURLConnection)  urlForGetRequest.openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("x-rapidapi-key", "9a1481d7c2msh108a954e62cd3aap18333ajsn28287b15539c");
        connection.setRequestProperty("x-rapidapi-host", "stock-price4.p.rapidapi.com");


        int responseCode = connection.getResponseCode();


        if (responseCode == HttpURLConnection.HTTP_OK){
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuffer response = new StringBuffer();
            while ((readLine = in.readLine()) != null) {
                response.append(readLine);
            }
            in.close();
            return response.toString();
        }
        else{
            return "GET NOT WORKED";
        }
    }
    public String getHeadline(String ticker) throws IOException {
        URL urlForGetRequest = new URL("https://google-news.p.rapidapi.com/v1/search?q=Eamz&country=US&lang=en" + ticker);
        String readLine = null;
        HttpURLConnection connection = (HttpURLConnection) urlForGetRequest.openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("x-rapidapi-key", "9a1481d7c2msh108a954e62cd3aap18333ajsn28287b15539c");
        connection.setRequestProperty("x-rapidapi-host", "google-news.p.rapidapi.com");


        int responseCode = connection.getResponseCode();


        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuffer response = new StringBuffer();
            while ((readLine = in.readLine()) != null) {
                response.append(readLine);
            }
            in.close();
            return response.toString();
        } else {
            return "GET NOT WORKED";
        }
    }
}
