module ApplicationHelper
  def default_meta_tags
    {
      site: 'SeeSHA',
<<<<<<< HEAD
      title: 'シーシャのフレーバーのオーダーの悩みから解放するアプリ「SeeSHA」',
      reverse: true,
      separator: '|',
      description: 'シーシャのフレーバーの組み合わせを探すならSeeSHA！シーシャ屋さんでフレーバーのオーダーで悩んだ経験はありませんか？初心者でも玄人でも簡単にフレーバーを決めてみよう！',
      canonical: https://www.seesha-app.com/,
=======
      title: 'フレーバーのオーダーの悩みから解放するアプリ「SeeSHA」',
      reverse: true,
      separator: '|',
      description: 'シーシャのフレーバーの組み合わせを探すならSeeSHA！シーシャ屋さんでフレーバーのオーダーで悩んだ経験はありませんか？初心者でも玄人でも簡単にフレーバーを決めてみよう！',
      canonical: 'https://www.seesha-app.com/',
>>>>>>> c0bcd72b8b3a7010682edf2df450253f3f246ce2
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('smoke.png') },
      ],
      og: {
        site_name: 'SeeSHA',
        title: 'シーシャのフレーバーのオーダーの悩みから解放するアプリ「SeeSHA」',
        description: 'シーシャのフレーバーの組み合わせを探すならSeeSHA！シーシャ屋さんでフレーバーのオーダーで悩んだ経験はありませんか？初心者でも玄人でも簡単にフレーバーを決めてみよう！',
        type: 'website',
<<<<<<< HEAD
        url: https://www.seesha-app.com/,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
=======
        url: 'https://www.seesha-app.com/',
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image'
>>>>>>> c0bcd72b8b3a7010682edf2df450253f3f246ce2
      }
    }
  end
end
