<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class SiswaModel extends CI_Model {
	
	public function view(){
		return $this->db->get('siswa')->result(); // Tampilkan semua data yang ada di tabel siswa
	}
	
	public function search($keyword){
		$this->db->where('nis', $keyword);
		$this->db->or_where('nama', $keyword);
		$this->db->or_where('jenis_kelamain', $keyword);
		$this->db->or_where('telp', $keyword);
		$this->db->or_where('alamat', $keyword);
		
		$result = $this->db->get('siswa')->result(); // Tampilkan data siswa berdasarkan keyword
		
		return $result; 
	}
}
