module ApplicationHelper
  def default_meta_tags
    {
      site: 'SeeSHA',
      title: 'シーシャのフレーバーのオーダーの悩みから解放するアプリ「SeeSHA」',
      reverse: true,
      separator: '|',
      description: 'シーシャのフレーバーの組み合わせを探すならSeeSHA！シーシャ屋さんでフレーバーのオーダーで悩んだ経験はありませんか？初心者でも玄人でも簡単にフレーバーを決めてみよう！',
      canonical: 'https://www.seesha-app.com/',
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('smoke.png') },
      ],
      og: {
        site_name: 'SeeSHA',
        title: 'シーシャのフレーバーのオーダーの悩みから解放するアプリ「SeeSHA」',
        description: 'シーシャのフレーバーの組み合わせを探すならSeeSHA！シーシャ屋さんでフレーバーのオーダーで悩んだ経験はありませんか？初心者でも玄人でも簡単にフレーバーを決めてみよう！',
        type: 'website',
        url: 'https://www.seesha-app.com/',
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      }
    }
  end
end
