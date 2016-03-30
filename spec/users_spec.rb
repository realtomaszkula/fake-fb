require 'spec_helper'

describe 'User' do

  before do
    @user_1 = User.create(name: 'Tomasz')
    @user_2 = User.create(name: 'Piotr')
  end

  it 'after sending friend request' do

    @user_1.friendships.create(friend_id: @user_2.id)

    expect { @user_2.received_friend_requests.size.to eql 1 }
    expect { @user_1.sent_friend_requests.size.to eql 1 }

    expect { @user_1.accepted_friendships.size.to eql 0 }
    expect { @user_2.accepted_friendships.size.to eql 0 }
  end

  it 'after accepting friend request' do
    @user_2.friendships.create(friend_id: @user_1.id)

    expect { @user_1.accepted_friendships.size.to eql 1 }
    expect { @user_1.accepted_friendships.first.to eql @user_2.id }

    expect { @user_2.accepted_friendships.size.to eql 1 }
    expect { @user_2.accepted_friendships.first.to eql @user_1.id }
  end


end