module ApplicationHelper
  def default_meta_tags
    {
      site: 'SeeSHA',
      title: 'タイトル',
      reverse: true,
      separator: '|',   #Webサイト名とページタイトルを区切るために使用されるテキスト
      description: 'ページの説明',
      keywords: 'シーシャ,  フレーバー, おすすめ',   #キーワードを「,」区切りで設定する
      canonical: request.original_url,   #優先するurlを指定する
      noindex: ! Rails.env.production?,
      icon: [                    #favicon、apple用アイコンを指定する
        { href: image_url('favicon.ico') },
        { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: 'サイト名',
        title: 'タイトル',
        description: 'ページの説明', 
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@ツイッターのアカウント名',
      }
      fb: {
        app_id: '自身のfacebookのapplication ID'
      }
    }
  end
end
