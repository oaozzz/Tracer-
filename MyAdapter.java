package com.example.tracer;

import android.app.DownloadManager;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;
import androidx.recyclerview.widget.RecyclerView;
import static android.os.Environment.DIRECTORY_DOWNLOADS;

import com.bumptech.glide.Glide;

import java.util.ArrayList;

public class MyAdapter extends RecyclerView.Adapter<MyViewHolder> {

    activity_down activity_down;
    ArrayList<DownModel> downModels;

    public MyAdapter(com.example.tracer.activity_down activity_down, ArrayList<DownModel> downModels) {
        this.activity_down = activity_down;
        this.downModels = downModels;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
        // ViewHolder를 새로 만들어야 할 때마다 onCreateViewHolder 호출
        // ViewHolder와 그에 연결된 View를 생성하고 초기화만 수행
        // ViewHolder가 아직 특정 데이터에 바인딩된 상태가 아니기 때문입니다
        LayoutInflater layoutInflater = LayoutInflater.from(activity_down.getBaseContext());
        View view = layoutInflater.inflate(R.layout.elements, null, false);

        return new MyViewHolder(view);
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    @Override
    public void onBindViewHolder(@NonNull final MyViewHolder myViewHolder, final int i) {
        // RecyclerView는 ViewHolder를 데이터와 연결할 때 이 메서드를 호출합니다.
        // 이 메서드는 적절한 데이터를 가져와서 그 데이터를 사용하여 뷰 홀더의 레이아웃을 채웁니다.
        // 예를 들어 RecyclerView가 이름 목록을 표시하는 경우
        // 메서드는 목록에서 적절한 이름을 찾아 뷰 홀더의 TextView 위젯을 채울 수 있습니다.
        myViewHolder.mName.setText(downModels.get(i).getName());
        Glide.with(activity_down).load(downModels.get(i).getImage()).into(myViewHolder.mImage);
        myViewHolder.mLink.setText(downModels.get(i).getLink());
        myViewHolder.mDownload.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                downloadFile(myViewHolder.mName.getContext(),downModels.get(i).getName(),".mp4",DIRECTORY_DOWNLOADS,downModels.get(i).getLink());
            }
        });
    }

    public void downloadFile(Context context, String fileName, String fileExtension, String destinationDirectory, String url) {

        DownloadManager downloadmanager = (DownloadManager) context.
                getSystemService(Context.DOWNLOAD_SERVICE);
        Uri uri = Uri.parse(url);
        DownloadManager.Request request = new DownloadManager.Request(uri);

        request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);
        request.setDestinationInExternalFilesDir(context, destinationDirectory, fileName + fileExtension);

        downloadmanager.enqueue(request);
    }


    @Override
    public int getItemCount() {
        return downModels.size();
    }
}