//
//  FakeNetworkData.swift
//  CNNFeedTests
//
//  Created by Lior Tal on 25/11/2020.
//

import Foundation

struct FakeNetworkData {
    static var data: Data {
        Data(dataString.utf8)
    }
    
    static var url: URL? {
        URL(string: "fake_url")
    }
    
    private static let dataString = """
    <?xml version="1.0" encoding="UTF-8"?>
    <?xml-stylesheet type="text/xsl" media="screen" href="/~d/styles/rss2full.xsl"?>
    <?xml-stylesheet type="text/css" media="screen" href="http://rss.cnn.com/~d/styles/itemcontent.css"?>
    <rss xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:media="http://search.yahoo.com/mrss/" xmlns:feedburner="http://rssnamespace.org/feedburner/ext/1.0" version="2.0">
        <channel>
            <title>
                <![CDATA[CNN.com - RSS Channel - App Travel Section]]>
            </title>
            <description>
                <![CDATA[CNN.com delivers up-to-the-minute news and information on the latest top stories, weather, entertainment, politics and more.]]>
            </description>
            <link>https://www.cnn.com/app-travel-section/index.html</link>
            <image>
                <url>http://i2.cdn.turner.com/cnn/2015/images/09/24/cnn.digital.png</url>
                <title>CNN.com - RSS Channel - App Travel Section</title>
                <link>https://www.cnn.com/app-travel-section/index.html</link>
            </image>
            <generator>coredev-bumblebee</generator>
            <lastBuildDate>Wed, 25 Nov 2020 14:51:03 GMT</lastBuildDate>
            <pubDate>Wed, 25 Nov 2020 11:22:07 GMT</pubDate>
            <copyright>
                <![CDATA[Copyright (c) 2020 Turner Broadcasting System, Inc. All Rights Reserved.]]>
            </copyright>
            <language>
                <![CDATA[en-US]]>
            </language>
            <ttl>10</ttl>
            <atom10:link xmlns:atom10="http://www.w3.org/2005/Atom" rel="self" type="application/rss+xml" href="http://rss.cnn.com/rss/edition_travel" />
            <feedburner:info uri="rss/edition_travel" />
            <atom10:link xmlns:atom10="http://www.w3.org/2005/Atom" rel="hub" href="http://pubsubhubbub.appspot.com/" />
            <item>
                <title>
                    <![CDATA[The $550 million megayacht concept that looks like a shark ]]>
                </title>
                <description>Just weeks after unveiling an upcoming yacht concept that resembles a swan, Lazzarini Design Studio are pushing the boundaries even further with a brand new design that's shaped like a shark.&lt;img src="http://feeds.feedburner.com/~r/rss/edition_travel/~4/taxpVHDnhfw" height="1" width="1" alt=""/&gt;</description>
                <link>http://rss.cnn.com/~r/rss/edition_travel/~3/taxpVHDnhfw/index.html</link>
                <guid isPermaLink="false">https://www.cnn.com/travel/article/new-superyacht-shaped-like-a-shark/index.html</guid>
                <pubDate>Wed, 25 Nov 2020 11:07:01 GMT</pubDate>
                <media:group>
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201120174019-the-prodigium-yacht-concept---interior-9-super-169.jpg" height="619" width="1100" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201120174019-the-prodigium-yacht-concept---interior-9-large-11.jpg" height="300" width="300" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201120174019-the-prodigium-yacht-concept---interior-9-vertical-large-gallery.jpg" height="552" width="414" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201120174019-the-prodigium-yacht-concept---interior-9-video-synd-2.jpg" height="480" width="640" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201120174019-the-prodigium-yacht-concept---interior-9-live-video.jpg" height="324" width="576" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201120174019-the-prodigium-yacht-concept---interior-9-t1-main.jpg" height="250" width="250" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201120174019-the-prodigium-yacht-concept---interior-9-vertical-gallery.jpg" height="360" width="270" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201120174019-the-prodigium-yacht-concept---interior-9-story-body.jpg" height="169" width="300" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201120174019-the-prodigium-yacht-concept---interior-9-t1-main.jpg" height="250" width="250" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201120174019-the-prodigium-yacht-concept---interior-9-assign.jpg" height="186" width="248" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201120174019-the-prodigium-yacht-concept---interior-9-hp-video.jpg" height="144" width="256" type="image/jpeg" />
                </media:group>
                <feedburner:origLink>https://www.cnn.com/travel/article/new-superyacht-shaped-like-a-shark/index.html</feedburner:origLink>
            </item>
            <item>
                <title>
                    <![CDATA[A Hollywood dialect coach explains why accents go wrong]]>
                </title>
                <description>How does an Irishman screw up an Irish accent, like in the movie "Wild Mountain Thyme"? Dialect coach Jack Wallace says it's easier than you might think.&lt;img src="http://feeds.feedburner.com/~r/rss/edition_travel/~4/ssoMwekjGo0" height="1" width="1" alt=""/&gt;</description>
                <link>http://rss.cnn.com/~r/rss/edition_travel/~3/ssoMwekjGo0/wild-mountain-thyme-accents-travel-orig.cnn</link>
                <guid isPermaLink="false">https://www.cnn.com/videos/travel/2020/11/20/wild-mountain-thyme-accents-travel-orig.cnn</guid>
                <pubDate>Mon, 23 Nov 2020 14:56:45 GMT</pubDate>
                <media:group>
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201118181136-wild-m-t-00852-super-169.jpg" height="619" width="1100" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201118181136-wild-m-t-00852-large-11.jpg" height="300" width="300" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201118181136-wild-m-t-00852-vertical-large-gallery.jpg" height="552" width="414" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201118181136-wild-m-t-00852-video-synd-2.jpg" height="480" width="640" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201118181136-wild-m-t-00852-live-video.jpg" height="324" width="576" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201118181136-wild-m-t-00852-t1-main.jpg" height="250" width="250" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201118181136-wild-m-t-00852-vertical-gallery.jpg" height="360" width="270" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201118181136-wild-m-t-00852-story-body.jpg" height="169" width="300" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201118181136-wild-m-t-00852-t1-main.jpg" height="250" width="250" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201118181136-wild-m-t-00852-assign.jpg" height="186" width="248" type="image/jpeg" />
                    <media:content medium="image" url="https://cdn.cnn.com/cnnnext/dam/assets/201118181136-wild-m-t-00852-hp-video.jpg" height="144" width="256" type="image/jpeg" />
                </media:group>
                <feedburner:origLink>https://www.cnn.com/videos/travel/2020/11/20/wild-mountain-thyme-accents-travel-orig.cnn</feedburner:origLink>
            </item>
        </channel>
    </rss>
    """
}
