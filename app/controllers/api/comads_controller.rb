class Api::ComadsController < ApplicationController
  def get_comads_list
    @user = User.find(1)
    
    @comads = Comad.find(:all)
    @group_comads = [] 
    @will_comads = []
    @normal_comads = []

    @comads.each do |comad|
      if comad.is_group
        @group_comads.push(comad)
      else
        @attend_comad_list = Comad::ComadUser.find(:all)
        @attend_comad_list.each do |attend|
          if attend.user_id == @user.id && comad.id == attend.comad_id
            @will_comads.push(comad)
          end
        end
        @normal_comads.push(comad)
      end
    end

    @json = {}
    @json[:will] = @will_comads
    @json[:group] = @group_comads
    @json[:comad] = @normal_comads

    render :json => @json
=begin
    @will_comads = {}
    @will_comads[:name] = ["足立壮大","小林大志"]
    @will_comads[:image] = ["adachi.png","kobayashi.png"]
    @will_comads[:time] = ["2013/11/13(水) 13:00〜18:00","2013/11/17(水) 13:00〜21:00","2013/11/19(水) 11:00〜18:00"]
    @will_comads[:location] = ["烏丸のスタバ","寒梅館"]
    @will_comads[:attend_friends] = ["中川峰志さん他3名","足立壮大さん他2名"]

    @group_comads = {}
    @group_comads[:name] = ["ピコラ","Campus","あんさんぶる"]
    @group_comads[:image] = ["picola.png","campus.png","kimisaki.png"]
    @group_comads[:time] = ["2013/11/13(水) 13:00〜18:00","2013/11/17(水) 13:00〜21:00","2013/11/19(水) 11:00〜18:00"]
    @group_comads[:location] = ["グランフロント大阪","オフィス","オフィス"]
    @group_comads[:attend_friends] = ["中川峰志さん他3名","中川峰志さん他3名","足立壮大さん他2名"]

    @comads = {}
    @comads[:name] = ["中川峰志","松本凌","佐藤大輔","村田温美","浅野友希"]
    @comads[:image] = ["nakagawa.png","matsumoto.png","sato.png","murata.png","asano.png"]
    @comads[:time] = ["2013/11/13(水) 13:00〜18:00","2013/11/17(水) 13:00〜21:00","2013/11/19(水) 11:00〜18:00","2013/11/19(水) 11:00〜18:00","2013/11/21(水) 11:00〜18:00"]
    @comads[:location] = ["BKC","楽洛堂","枚方のマクド","寒梅館","カナート"]
    @comads[:attend_friends] = ["佐藤大輔さん他1名","中川峰志さん","足立壮大さん他2名","浅野友希さん他3名","村田温美さん他5名"]

    @json = {} 
    @json[:will] = []
    2.times do |i|
      @user = {}
      @user[:name] = @will_comads[:name][i]
      @user[:image] = @will_comads[:image][i]
      @user[:time] = @will_comads[:time][i]
      @user[:location] = @will_comads[:location][i]
      @user[:attend_friends] = @will_comads[:attend_friends][i]
      @json[:will].push(@user)
    end

    @json[:group] = []
    3.times do |i|
      @group = {}
      @group[:name] = @group_comads[:name][i]
      @group[:image] = @group_comads[:image][i]
      @group[:time] = @group_comads[:time][i]
      @group[:location] = @group_comads[:location][i]
      @group[:attend_friends] = @group_comads[:attend_friends][i]
      @json[:group].push(@group)
    end

    @json[:comad] = []
    5.times do |i|
      @comad = {}
      @comad[:name] = @comads[:name][i]
      @comad[:image] = @comads[:image][i]
      @comad[:time] = @comads[:time][i]
      @comad[:location] = @comads[:location][i]
      @comad[:attend_friends] = @comads[:attend_friends][i]
      @json[:comad].push(@comad)
    end
=end
  end

  def create_comad
    @hoge = params
    render :json => @hoge
  end
end
