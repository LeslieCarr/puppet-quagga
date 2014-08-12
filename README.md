puppet-quagga
=============

A puppet module for quagga. Contributions welcome!

## Example for BGP (Work in progress)

	class {'quagga':
		asn=> "65001",
		zebra=> true,
		bgpd=> true,
		hostname=> "host.bgp.me",
		password=> "password",
		enable=> "strong_password",
		network=>[
			"192.168.1.0/25",
			"192.168.1.128/25"
		],
		router_id=> "10.0.0.1",
		bgp_neighbors =>{
			"bgp1"=>{
				neighbor_ip   => "10.0.0.2",
				neighbor_as   => "65002",
				description   => "AS-002",
				route_map_in  => "med-100",
				route_map_out => "med-100"
			},
			"bgp2"=>{
				neighbor_ip => "10.0.0.3",
				neighbor_as => "65003",
				description => "AS-003",
				next_hop_self => true
			},
		},
		ip_prefix_list =>{
			"line1"=>{
				name => "ALL",
				description => "TEST-DESC"
			},
			"line2"=>{
				name => "ALL",
				num => "10",
				action => "deny",
				prefix => "10.0.0.0/8"
			}
		},
		route_map =>{
			"MED"=> {
				action => "permit",
				order => "5",
				metric => "100",
				as_path_prepend => "65002 65002",
			}
		},
	}

