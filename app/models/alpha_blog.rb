class AlphaBlog < ApplicationRecord
    
    validates_presence_of :title
    validates :title, length: {minimum:3, maximum:50}

    # validates_presence_of :descreption, 
    # length: {minimum:3, maximum:300}


end
