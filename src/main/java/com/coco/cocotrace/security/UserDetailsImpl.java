package com.coco.cocotrace.security;

import java.util.HashSet;
import java.util.Set;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.coco.cocotrace.models.User;
import com.coco.cocotrace.models.Role;


public class UserDetailsImpl implements UserDetails{

	private User user;
	
	public UserDetailsImpl(User user) {
		this.user=user;
	}
	
	@Override
	public Collection<? extends GrantedAuthority > getAuthorities(){
		Set <GrantedAuthority > grantedAuthorities = new HashSet < > ();
	for (Role role: user.getRoles()) {
		grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
	}
	return grantedAuthorities;
	}
	

	public int getID() {
		
		return user.getId();
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return user.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
}
