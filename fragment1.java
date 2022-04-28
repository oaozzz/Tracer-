package com.example.tracer;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;

import android.net.Uri;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.MediaController;
import android.widget.VideoView;


public class fragment1 extends Fragment {
    WebView webView;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {


        View fragment1 = inflater.inflate(R.layout.fragment_fragment1, container, false);

        webView = fragment1.findViewById(R.id.webView);

        WebSettings settings = webView.getSettings();

        settings.setJavaScriptEnabled(true);

        webView.setWebViewClient(new WebViewClient());

        webView.loadUrl("http://naver.com");

        return fragment1;
    }
}
//        View fragment1 = inflater.inflate(R.layout.fragment_fragment1, container, false);
//        //artivitiy_video.xml에 있는 VidioView
//        VideoView videoview=(VideoView) fragment1.findViewById(R.id.videoView);
//        //Video View에서 보여줄 동영상주소.
//        Uri url= Uri.parse("https://ykarr.github.io/web/test.mp4");
//        videoview.setVideoURI(url);
//        //비디오 컨트롤바.
//        videoview.setMediaController(new MediaController(getActivity()));
//        videoview.start();
//        return fragment1;

