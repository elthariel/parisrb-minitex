##
## hash_tags_controller.rb
## Login : <lta@still>
## Started on  Tue May 28 14:44:04 2013 Lta Akr
## $Id$
##
## Author(s):
##  - Lta Akr <>
##
## Copyright (C) 2013 Lta Akr
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
##

class HashTagsController < RocketPants::Base
  version 1

  def index
    expose HashTag.page(params[:page])
  end

  def show
    if params[:id].to_i > 0
      @ht = HashTag.find(params[:id])
    else
      @ht = HashTag.where(name: params[:id]).first
    end
    expose @ht.texes.page(params[:page])
  end
end
