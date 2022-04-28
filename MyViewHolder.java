package com.example.tracer;



import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

public class MyViewHolder extends RecyclerView.ViewHolder {

    TextView mName;TextView mLink;
    ImageView mImage;
    Button mDownload;
    public MyViewHolder(@NonNull View itemView) {
        super(itemView);

        mName=itemView.findViewById(R.id.name);
        mImage=itemView.findViewById(R.id.image);
        mLink=itemView.findViewById(R.id.link);
        mDownload=itemView.findViewById(R.id.down);



    }
}