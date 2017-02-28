ad_page_contract {}

ad_form -html { enctype multipart/form-data } -name video -form {
    {video_id:key}
    {video:text 
	{label "[_ videos.Embed]"}
	{html {size 50} }
    }    
} -on_submit {

} -new_data {

    db_transaction {
	set video_id [videos::new_link -url [util_text_to_url -text $video]]   
    }
}






