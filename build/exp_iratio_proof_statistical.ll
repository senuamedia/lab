; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"lcg_next"(i64 %state) nounwind {
entry:
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t9 = load i64, ptr %local.state
  %t10 = mul i64 %t9, 1664525
  %t11 = add i64 %t10, 1013904223
  ret i64 %t11
}

define i64 @"lcg_f64"(i64 %state) nounwind {
entry:
  %local.s.12 = alloca i64
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t13 = load i64, ptr %local.state
  store i64 %t13, ptr %local.s.12
  %t14 = load i64, ptr %local.s.12
  %t15 = icmp slt i64 %t14, 0
  %t16 = zext i1 %t15 to i64
  %t17 = icmp ne i64 %t16, 0
  br i1 %t17, label %then1, label %else1
then1:
  %t18 = load i64, ptr %local.s.12
  %t19 = sub i64 0, %t18
  store i64 %t19, ptr %local.s.12
  br label %then1_end
then1_end:
  br label %endif1
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t20 = phi i64 [ 0, %then1_end ], [ 0, %else1_end ]
  %t21 = load i64, ptr %local.s.12
  %t22 = srem i64 %t21, 10000
  %t23 = call i64 @"sx_int_to_f64"(i64 %t22)
  %t24 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.2)
  %t25 = call i64 @"sx_f64_div"(i64 %t23, i64 %t24)
  ret i64 %t25
}

define i64 @"iratio_k3"(i64 %seed) nounwind {
entry:
  %local.rng.26 = alloca i64
  %local.a0.27 = alloca i64
  %local.a1.28 = alloca i64
  %local.a2.29 = alloca i64
  %local.a3.30 = alloca i64
  %local.b0.31 = alloca i64
  %local.b1.32 = alloca i64
  %local.b2.33 = alloca i64
  %local.b3.34 = alloca i64
  %local.c0.35 = alloca i64
  %local.c1.36 = alloca i64
  %local.c2.37 = alloca i64
  %local.c3.38 = alloca i64
  %local.m0.39 = alloca i64
  %local.m1.40 = alloca i64
  %local.m2.41 = alloca i64
  %local.m3.42 = alloca i64
  %local.ga0.43 = alloca i64
  %local.ga1.44 = alloca i64
  %local.ga2.45 = alloca i64
  %local.ga3.46 = alloca i64
  %local.gb0.47 = alloca i64
  %local.gb1.48 = alloca i64
  %local.gb2.49 = alloca i64
  %local.gb3.50 = alloca i64
  %local.gc0.51 = alloca i64
  %local.gc1.52 = alloca i64
  %local.gc2.53 = alloca i64
  %local.gc3.54 = alloca i64
  %local.dab.55 = alloca i64
  %local.dac.56 = alloca i64
  %local.dbc.57 = alloca i64
  %local.cross.58 = alloca i64
  %local.na.59 = alloca i64
  %local.nb.60 = alloca i64
  %local.nc.61 = alloca i64
  %local.ind.62 = alloca i64
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t63 = load i64, ptr %local.seed
  store i64 %t63, ptr %local.rng.26
  %t64 = load i64, ptr %local.rng.26
  %t65 = call i64 @"lcg_next"(i64 %t64)
  store i64 %t65, ptr %local.rng.26
  %t66 = load i64, ptr %local.rng.26
  %t67 = call i64 @"lcg_f64"(i64 %t66)
  %t68 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.3)
  %t69 = call i64 @"sx_f64_sub"(i64 %t67, i64 %t68)
  %t70 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.4)
  %t71 = call i64 @"sx_f64_mul"(i64 %t69, i64 %t70)
  store i64 %t71, ptr %local.a0.27
  %t72 = load i64, ptr %local.rng.26
  %t73 = call i64 @"lcg_next"(i64 %t72)
  store i64 %t73, ptr %local.rng.26
  %t74 = load i64, ptr %local.rng.26
  %t75 = call i64 @"lcg_f64"(i64 %t74)
  %t76 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.5)
  %t77 = call i64 @"sx_f64_sub"(i64 %t75, i64 %t76)
  %t78 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.6)
  %t79 = call i64 @"sx_f64_mul"(i64 %t77, i64 %t78)
  store i64 %t79, ptr %local.a1.28
  %t80 = load i64, ptr %local.rng.26
  %t81 = call i64 @"lcg_next"(i64 %t80)
  store i64 %t81, ptr %local.rng.26
  %t82 = load i64, ptr %local.rng.26
  %t83 = call i64 @"lcg_f64"(i64 %t82)
  %t84 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.7)
  %t85 = call i64 @"sx_f64_sub"(i64 %t83, i64 %t84)
  %t86 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.8)
  %t87 = call i64 @"sx_f64_mul"(i64 %t85, i64 %t86)
  store i64 %t87, ptr %local.a2.29
  %t88 = load i64, ptr %local.rng.26
  %t89 = call i64 @"lcg_next"(i64 %t88)
  store i64 %t89, ptr %local.rng.26
  %t90 = load i64, ptr %local.rng.26
  %t91 = call i64 @"lcg_f64"(i64 %t90)
  %t92 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.9)
  %t93 = call i64 @"sx_f64_sub"(i64 %t91, i64 %t92)
  %t94 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.10)
  %t95 = call i64 @"sx_f64_mul"(i64 %t93, i64 %t94)
  store i64 %t95, ptr %local.a3.30
  %t96 = load i64, ptr %local.rng.26
  %t97 = call i64 @"lcg_next"(i64 %t96)
  store i64 %t97, ptr %local.rng.26
  %t98 = load i64, ptr %local.rng.26
  %t99 = call i64 @"lcg_f64"(i64 %t98)
  %t100 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.11)
  %t101 = call i64 @"sx_f64_sub"(i64 %t99, i64 %t100)
  %t102 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.12)
  %t103 = call i64 @"sx_f64_mul"(i64 %t101, i64 %t102)
  store i64 %t103, ptr %local.b0.31
  %t104 = load i64, ptr %local.rng.26
  %t105 = call i64 @"lcg_next"(i64 %t104)
  store i64 %t105, ptr %local.rng.26
  %t106 = load i64, ptr %local.rng.26
  %t107 = call i64 @"lcg_f64"(i64 %t106)
  %t108 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.13)
  %t109 = call i64 @"sx_f64_sub"(i64 %t107, i64 %t108)
  %t110 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.14)
  %t111 = call i64 @"sx_f64_mul"(i64 %t109, i64 %t110)
  store i64 %t111, ptr %local.b1.32
  %t112 = load i64, ptr %local.rng.26
  %t113 = call i64 @"lcg_next"(i64 %t112)
  store i64 %t113, ptr %local.rng.26
  %t114 = load i64, ptr %local.rng.26
  %t115 = call i64 @"lcg_f64"(i64 %t114)
  %t116 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.15)
  %t117 = call i64 @"sx_f64_sub"(i64 %t115, i64 %t116)
  %t118 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.16)
  %t119 = call i64 @"sx_f64_mul"(i64 %t117, i64 %t118)
  store i64 %t119, ptr %local.b2.33
  %t120 = load i64, ptr %local.rng.26
  %t121 = call i64 @"lcg_next"(i64 %t120)
  store i64 %t121, ptr %local.rng.26
  %t122 = load i64, ptr %local.rng.26
  %t123 = call i64 @"lcg_f64"(i64 %t122)
  %t124 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.17)
  %t125 = call i64 @"sx_f64_sub"(i64 %t123, i64 %t124)
  %t126 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.18)
  %t127 = call i64 @"sx_f64_mul"(i64 %t125, i64 %t126)
  store i64 %t127, ptr %local.b3.34
  %t128 = load i64, ptr %local.rng.26
  %t129 = call i64 @"lcg_next"(i64 %t128)
  store i64 %t129, ptr %local.rng.26
  %t130 = load i64, ptr %local.rng.26
  %t131 = call i64 @"lcg_f64"(i64 %t130)
  %t132 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.19)
  %t133 = call i64 @"sx_f64_sub"(i64 %t131, i64 %t132)
  %t134 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.20)
  %t135 = call i64 @"sx_f64_mul"(i64 %t133, i64 %t134)
  store i64 %t135, ptr %local.c0.35
  %t136 = load i64, ptr %local.rng.26
  %t137 = call i64 @"lcg_next"(i64 %t136)
  store i64 %t137, ptr %local.rng.26
  %t138 = load i64, ptr %local.rng.26
  %t139 = call i64 @"lcg_f64"(i64 %t138)
  %t140 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.21)
  %t141 = call i64 @"sx_f64_sub"(i64 %t139, i64 %t140)
  %t142 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.22)
  %t143 = call i64 @"sx_f64_mul"(i64 %t141, i64 %t142)
  store i64 %t143, ptr %local.c1.36
  %t144 = load i64, ptr %local.rng.26
  %t145 = call i64 @"lcg_next"(i64 %t144)
  store i64 %t145, ptr %local.rng.26
  %t146 = load i64, ptr %local.rng.26
  %t147 = call i64 @"lcg_f64"(i64 %t146)
  %t148 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.23)
  %t149 = call i64 @"sx_f64_sub"(i64 %t147, i64 %t148)
  %t150 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.24)
  %t151 = call i64 @"sx_f64_mul"(i64 %t149, i64 %t150)
  store i64 %t151, ptr %local.c2.37
  %t152 = load i64, ptr %local.rng.26
  %t153 = call i64 @"lcg_next"(i64 %t152)
  store i64 %t153, ptr %local.rng.26
  %t154 = load i64, ptr %local.rng.26
  %t155 = call i64 @"lcg_f64"(i64 %t154)
  %t156 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.25)
  %t157 = call i64 @"sx_f64_sub"(i64 %t155, i64 %t156)
  %t158 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.26)
  %t159 = call i64 @"sx_f64_mul"(i64 %t157, i64 %t158)
  store i64 %t159, ptr %local.c3.38
  %t160 = load i64, ptr %local.a0.27
  %t161 = load i64, ptr %local.b0.31
  %t162 = call i64 @"sx_f64_add"(i64 %t160, i64 %t161)
  %t163 = load i64, ptr %local.c0.35
  %t164 = call i64 @"sx_f64_add"(i64 %t162, i64 %t163)
  %t165 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.27)
  %t166 = call i64 @"sx_f64_div"(i64 %t164, i64 %t165)
  store i64 %t166, ptr %local.m0.39
  %t167 = load i64, ptr %local.a1.28
  %t168 = load i64, ptr %local.b1.32
  %t169 = call i64 @"sx_f64_add"(i64 %t167, i64 %t168)
  %t170 = load i64, ptr %local.c1.36
  %t171 = call i64 @"sx_f64_add"(i64 %t169, i64 %t170)
  %t172 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.28)
  %t173 = call i64 @"sx_f64_div"(i64 %t171, i64 %t172)
  store i64 %t173, ptr %local.m1.40
  %t174 = load i64, ptr %local.a2.29
  %t175 = load i64, ptr %local.b2.33
  %t176 = call i64 @"sx_f64_add"(i64 %t174, i64 %t175)
  %t177 = load i64, ptr %local.c2.37
  %t178 = call i64 @"sx_f64_add"(i64 %t176, i64 %t177)
  %t179 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.29)
  %t180 = call i64 @"sx_f64_div"(i64 %t178, i64 %t179)
  store i64 %t180, ptr %local.m2.41
  %t181 = load i64, ptr %local.a3.30
  %t182 = load i64, ptr %local.b3.34
  %t183 = call i64 @"sx_f64_add"(i64 %t181, i64 %t182)
  %t184 = load i64, ptr %local.c3.38
  %t185 = call i64 @"sx_f64_add"(i64 %t183, i64 %t184)
  %t186 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.30)
  %t187 = call i64 @"sx_f64_div"(i64 %t185, i64 %t186)
  store i64 %t187, ptr %local.m3.42
  %t188 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.31)
  %t189 = load i64, ptr %local.m0.39
  %t190 = load i64, ptr %local.a0.27
  %t191 = call i64 @"sx_f64_sub"(i64 %t189, i64 %t190)
  %t192 = call i64 @"sx_f64_mul"(i64 %t188, i64 %t191)
  store i64 %t192, ptr %local.ga0.43
  %t193 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.32)
  %t194 = load i64, ptr %local.m1.40
  %t195 = load i64, ptr %local.a1.28
  %t196 = call i64 @"sx_f64_sub"(i64 %t194, i64 %t195)
  %t197 = call i64 @"sx_f64_mul"(i64 %t193, i64 %t196)
  store i64 %t197, ptr %local.ga1.44
  %t198 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.33)
  %t199 = load i64, ptr %local.m2.41
  %t200 = load i64, ptr %local.a2.29
  %t201 = call i64 @"sx_f64_sub"(i64 %t199, i64 %t200)
  %t202 = call i64 @"sx_f64_mul"(i64 %t198, i64 %t201)
  store i64 %t202, ptr %local.ga2.45
  %t203 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.34)
  %t204 = load i64, ptr %local.m3.42
  %t205 = load i64, ptr %local.a3.30
  %t206 = call i64 @"sx_f64_sub"(i64 %t204, i64 %t205)
  %t207 = call i64 @"sx_f64_mul"(i64 %t203, i64 %t206)
  store i64 %t207, ptr %local.ga3.46
  %t208 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.35)
  %t209 = load i64, ptr %local.m0.39
  %t210 = load i64, ptr %local.b0.31
  %t211 = call i64 @"sx_f64_sub"(i64 %t209, i64 %t210)
  %t212 = call i64 @"sx_f64_mul"(i64 %t208, i64 %t211)
  store i64 %t212, ptr %local.gb0.47
  %t213 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.36)
  %t214 = load i64, ptr %local.m1.40
  %t215 = load i64, ptr %local.b1.32
  %t216 = call i64 @"sx_f64_sub"(i64 %t214, i64 %t215)
  %t217 = call i64 @"sx_f64_mul"(i64 %t213, i64 %t216)
  store i64 %t217, ptr %local.gb1.48
  %t218 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.37)
  %t219 = load i64, ptr %local.m2.41
  %t220 = load i64, ptr %local.b2.33
  %t221 = call i64 @"sx_f64_sub"(i64 %t219, i64 %t220)
  %t222 = call i64 @"sx_f64_mul"(i64 %t218, i64 %t221)
  store i64 %t222, ptr %local.gb2.49
  %t223 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.38)
  %t224 = load i64, ptr %local.m3.42
  %t225 = load i64, ptr %local.b3.34
  %t226 = call i64 @"sx_f64_sub"(i64 %t224, i64 %t225)
  %t227 = call i64 @"sx_f64_mul"(i64 %t223, i64 %t226)
  store i64 %t227, ptr %local.gb3.50
  %t228 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.39)
  %t229 = load i64, ptr %local.m0.39
  %t230 = load i64, ptr %local.c0.35
  %t231 = call i64 @"sx_f64_sub"(i64 %t229, i64 %t230)
  %t232 = call i64 @"sx_f64_mul"(i64 %t228, i64 %t231)
  store i64 %t232, ptr %local.gc0.51
  %t233 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.40)
  %t234 = load i64, ptr %local.m1.40
  %t235 = load i64, ptr %local.c1.36
  %t236 = call i64 @"sx_f64_sub"(i64 %t234, i64 %t235)
  %t237 = call i64 @"sx_f64_mul"(i64 %t233, i64 %t236)
  store i64 %t237, ptr %local.gc1.52
  %t238 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.41)
  %t239 = load i64, ptr %local.m2.41
  %t240 = load i64, ptr %local.c2.37
  %t241 = call i64 @"sx_f64_sub"(i64 %t239, i64 %t240)
  %t242 = call i64 @"sx_f64_mul"(i64 %t238, i64 %t241)
  store i64 %t242, ptr %local.gc2.53
  %t243 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.42)
  %t244 = load i64, ptr %local.m3.42
  %t245 = load i64, ptr %local.c3.38
  %t246 = call i64 @"sx_f64_sub"(i64 %t244, i64 %t245)
  %t247 = call i64 @"sx_f64_mul"(i64 %t243, i64 %t246)
  store i64 %t247, ptr %local.gc3.54
  %t248 = load i64, ptr %local.ga0.43
  %t249 = load i64, ptr %local.gb0.47
  %t250 = call i64 @"sx_f64_mul"(i64 %t248, i64 %t249)
  %t251 = load i64, ptr %local.ga1.44
  %t252 = load i64, ptr %local.gb1.48
  %t253 = call i64 @"sx_f64_mul"(i64 %t251, i64 %t252)
  %t254 = call i64 @"sx_f64_add"(i64 %t250, i64 %t253)
  %t255 = load i64, ptr %local.ga2.45
  %t256 = load i64, ptr %local.gb2.49
  %t257 = call i64 @"sx_f64_mul"(i64 %t255, i64 %t256)
  %t258 = call i64 @"sx_f64_add"(i64 %t254, i64 %t257)
  %t259 = load i64, ptr %local.ga3.46
  %t260 = load i64, ptr %local.gb3.50
  %t261 = call i64 @"sx_f64_mul"(i64 %t259, i64 %t260)
  %t262 = call i64 @"sx_f64_add"(i64 %t258, i64 %t261)
  store i64 %t262, ptr %local.dab.55
  %t263 = load i64, ptr %local.ga0.43
  %t264 = load i64, ptr %local.gc0.51
  %t265 = call i64 @"sx_f64_mul"(i64 %t263, i64 %t264)
  %t266 = load i64, ptr %local.ga1.44
  %t267 = load i64, ptr %local.gc1.52
  %t268 = call i64 @"sx_f64_mul"(i64 %t266, i64 %t267)
  %t269 = call i64 @"sx_f64_add"(i64 %t265, i64 %t268)
  %t270 = load i64, ptr %local.ga2.45
  %t271 = load i64, ptr %local.gc2.53
  %t272 = call i64 @"sx_f64_mul"(i64 %t270, i64 %t271)
  %t273 = call i64 @"sx_f64_add"(i64 %t269, i64 %t272)
  %t274 = load i64, ptr %local.ga3.46
  %t275 = load i64, ptr %local.gc3.54
  %t276 = call i64 @"sx_f64_mul"(i64 %t274, i64 %t275)
  %t277 = call i64 @"sx_f64_add"(i64 %t273, i64 %t276)
  store i64 %t277, ptr %local.dac.56
  %t278 = load i64, ptr %local.gb0.47
  %t279 = load i64, ptr %local.gc0.51
  %t280 = call i64 @"sx_f64_mul"(i64 %t278, i64 %t279)
  %t281 = load i64, ptr %local.gb1.48
  %t282 = load i64, ptr %local.gc1.52
  %t283 = call i64 @"sx_f64_mul"(i64 %t281, i64 %t282)
  %t284 = call i64 @"sx_f64_add"(i64 %t280, i64 %t283)
  %t285 = load i64, ptr %local.gb2.49
  %t286 = load i64, ptr %local.gc2.53
  %t287 = call i64 @"sx_f64_mul"(i64 %t285, i64 %t286)
  %t288 = call i64 @"sx_f64_add"(i64 %t284, i64 %t287)
  %t289 = load i64, ptr %local.gb3.50
  %t290 = load i64, ptr %local.gc3.54
  %t291 = call i64 @"sx_f64_mul"(i64 %t289, i64 %t290)
  %t292 = call i64 @"sx_f64_add"(i64 %t288, i64 %t291)
  store i64 %t292, ptr %local.dbc.57
  %t293 = load i64, ptr %local.dab.55
  %t294 = load i64, ptr %local.dac.56
  %t295 = call i64 @"sx_f64_add"(i64 %t293, i64 %t294)
  %t296 = load i64, ptr %local.dbc.57
  %t297 = call i64 @"sx_f64_add"(i64 %t295, i64 %t296)
  store i64 %t297, ptr %local.cross.58
  %t298 = load i64, ptr %local.ga0.43
  %t299 = load i64, ptr %local.ga0.43
  %t300 = call i64 @"sx_f64_mul"(i64 %t298, i64 %t299)
  %t301 = load i64, ptr %local.ga1.44
  %t302 = load i64, ptr %local.ga1.44
  %t303 = call i64 @"sx_f64_mul"(i64 %t301, i64 %t302)
  %t304 = call i64 @"sx_f64_add"(i64 %t300, i64 %t303)
  %t305 = load i64, ptr %local.ga2.45
  %t306 = load i64, ptr %local.ga2.45
  %t307 = call i64 @"sx_f64_mul"(i64 %t305, i64 %t306)
  %t308 = call i64 @"sx_f64_add"(i64 %t304, i64 %t307)
  %t309 = load i64, ptr %local.ga3.46
  %t310 = load i64, ptr %local.ga3.46
  %t311 = call i64 @"sx_f64_mul"(i64 %t309, i64 %t310)
  %t312 = call i64 @"sx_f64_add"(i64 %t308, i64 %t311)
  store i64 %t312, ptr %local.na.59
  %t313 = load i64, ptr %local.gb0.47
  %t314 = load i64, ptr %local.gb0.47
  %t315 = call i64 @"sx_f64_mul"(i64 %t313, i64 %t314)
  %t316 = load i64, ptr %local.gb1.48
  %t317 = load i64, ptr %local.gb1.48
  %t318 = call i64 @"sx_f64_mul"(i64 %t316, i64 %t317)
  %t319 = call i64 @"sx_f64_add"(i64 %t315, i64 %t318)
  %t320 = load i64, ptr %local.gb2.49
  %t321 = load i64, ptr %local.gb2.49
  %t322 = call i64 @"sx_f64_mul"(i64 %t320, i64 %t321)
  %t323 = call i64 @"sx_f64_add"(i64 %t319, i64 %t322)
  %t324 = load i64, ptr %local.gb3.50
  %t325 = load i64, ptr %local.gb3.50
  %t326 = call i64 @"sx_f64_mul"(i64 %t324, i64 %t325)
  %t327 = call i64 @"sx_f64_add"(i64 %t323, i64 %t326)
  store i64 %t327, ptr %local.nb.60
  %t328 = load i64, ptr %local.gc0.51
  %t329 = load i64, ptr %local.gc0.51
  %t330 = call i64 @"sx_f64_mul"(i64 %t328, i64 %t329)
  %t331 = load i64, ptr %local.gc1.52
  %t332 = load i64, ptr %local.gc1.52
  %t333 = call i64 @"sx_f64_mul"(i64 %t331, i64 %t332)
  %t334 = call i64 @"sx_f64_add"(i64 %t330, i64 %t333)
  %t335 = load i64, ptr %local.gc2.53
  %t336 = load i64, ptr %local.gc2.53
  %t337 = call i64 @"sx_f64_mul"(i64 %t335, i64 %t336)
  %t338 = call i64 @"sx_f64_add"(i64 %t334, i64 %t337)
  %t339 = load i64, ptr %local.gc3.54
  %t340 = load i64, ptr %local.gc3.54
  %t341 = call i64 @"sx_f64_mul"(i64 %t339, i64 %t340)
  %t342 = call i64 @"sx_f64_add"(i64 %t338, i64 %t341)
  store i64 %t342, ptr %local.nc.61
  %t343 = load i64, ptr %local.na.59
  %t344 = load i64, ptr %local.nb.60
  %t345 = call i64 @"sx_f64_add"(i64 %t343, i64 %t344)
  %t346 = load i64, ptr %local.nc.61
  %t347 = call i64 @"sx_f64_add"(i64 %t345, i64 %t346)
  store i64 %t347, ptr %local.ind.62
  %t348 = load i64, ptr %local.ind.62
  %t349 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.43)
  %t350 = call i64 @"sx_f64_lt"(i64 %t348, i64 %t349)
  %t351 = icmp ne i64 %t350, 0
  br i1 %t351, label %then2, label %else2
then2:
  %t352 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.44)
  ret i64 %t352
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t353 = phi i64 [ 0, %else2_end ]
  %t354 = load i64, ptr %local.cross.58
  %t355 = load i64, ptr %local.ind.62
  %t356 = call i64 @"sx_f64_div"(i64 %t354, i64 %t355)
  ret i64 %t356
}

define i64 @"iratio_k5"(i64 %seed) nounwind {
entry:
  %local.rng.357 = alloca i64
  %local.a0.358 = alloca i64
  %local.a1.359 = alloca i64
  %local.b0.360 = alloca i64
  %local.b1.361 = alloca i64
  %local.c0.362 = alloca i64
  %local.c1.363 = alloca i64
  %local.d0.364 = alloca i64
  %local.d1.365 = alloca i64
  %local.e0.366 = alloca i64
  %local.e1.367 = alloca i64
  %local.m0.368 = alloca i64
  %local.m1.369 = alloca i64
  %local.ga0.370 = alloca i64
  %local.ga1.371 = alloca i64
  %local.gb0.372 = alloca i64
  %local.gb1.373 = alloca i64
  %local.gc0.374 = alloca i64
  %local.gc1.375 = alloca i64
  %local.gd0.376 = alloca i64
  %local.gd1.377 = alloca i64
  %local.ge0.378 = alloca i64
  %local.ge1.379 = alloca i64
  %local.c_ab.380 = alloca i64
  %local.c_ac.381 = alloca i64
  %local.c_ad.382 = alloca i64
  %local.c_ae.383 = alloca i64
  %local.c_bc.384 = alloca i64
  %local.c_bd.385 = alloca i64
  %local.c_be.386 = alloca i64
  %local.c_cd.387 = alloca i64
  %local.c_ce.388 = alloca i64
  %local.c_de.389 = alloca i64
  %local.cross.390 = alloca i64
  %local.na.391 = alloca i64
  %local.nb.392 = alloca i64
  %local.nc.393 = alloca i64
  %local.nd.394 = alloca i64
  %local.ne.395 = alloca i64
  %local.ind.396 = alloca i64
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t397 = load i64, ptr %local.seed
  store i64 %t397, ptr %local.rng.357
  %t398 = load i64, ptr %local.rng.357
  %t399 = call i64 @"lcg_next"(i64 %t398)
  store i64 %t399, ptr %local.rng.357
  %t400 = load i64, ptr %local.rng.357
  %t401 = call i64 @"lcg_f64"(i64 %t400)
  %t402 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.45)
  %t403 = call i64 @"sx_f64_sub"(i64 %t401, i64 %t402)
  %t404 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.46)
  %t405 = call i64 @"sx_f64_mul"(i64 %t403, i64 %t404)
  store i64 %t405, ptr %local.a0.358
  %t406 = load i64, ptr %local.rng.357
  %t407 = call i64 @"lcg_next"(i64 %t406)
  store i64 %t407, ptr %local.rng.357
  %t408 = load i64, ptr %local.rng.357
  %t409 = call i64 @"lcg_f64"(i64 %t408)
  %t410 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.47)
  %t411 = call i64 @"sx_f64_sub"(i64 %t409, i64 %t410)
  %t412 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.48)
  %t413 = call i64 @"sx_f64_mul"(i64 %t411, i64 %t412)
  store i64 %t413, ptr %local.a1.359
  %t414 = load i64, ptr %local.rng.357
  %t415 = call i64 @"lcg_next"(i64 %t414)
  store i64 %t415, ptr %local.rng.357
  %t416 = load i64, ptr %local.rng.357
  %t417 = call i64 @"lcg_f64"(i64 %t416)
  %t418 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.49)
  %t419 = call i64 @"sx_f64_sub"(i64 %t417, i64 %t418)
  %t420 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.50)
  %t421 = call i64 @"sx_f64_mul"(i64 %t419, i64 %t420)
  store i64 %t421, ptr %local.b0.360
  %t422 = load i64, ptr %local.rng.357
  %t423 = call i64 @"lcg_next"(i64 %t422)
  store i64 %t423, ptr %local.rng.357
  %t424 = load i64, ptr %local.rng.357
  %t425 = call i64 @"lcg_f64"(i64 %t424)
  %t426 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.51)
  %t427 = call i64 @"sx_f64_sub"(i64 %t425, i64 %t426)
  %t428 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.52)
  %t429 = call i64 @"sx_f64_mul"(i64 %t427, i64 %t428)
  store i64 %t429, ptr %local.b1.361
  %t430 = load i64, ptr %local.rng.357
  %t431 = call i64 @"lcg_next"(i64 %t430)
  store i64 %t431, ptr %local.rng.357
  %t432 = load i64, ptr %local.rng.357
  %t433 = call i64 @"lcg_f64"(i64 %t432)
  %t434 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.53)
  %t435 = call i64 @"sx_f64_sub"(i64 %t433, i64 %t434)
  %t436 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.54)
  %t437 = call i64 @"sx_f64_mul"(i64 %t435, i64 %t436)
  store i64 %t437, ptr %local.c0.362
  %t438 = load i64, ptr %local.rng.357
  %t439 = call i64 @"lcg_next"(i64 %t438)
  store i64 %t439, ptr %local.rng.357
  %t440 = load i64, ptr %local.rng.357
  %t441 = call i64 @"lcg_f64"(i64 %t440)
  %t442 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.55)
  %t443 = call i64 @"sx_f64_sub"(i64 %t441, i64 %t442)
  %t444 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.56)
  %t445 = call i64 @"sx_f64_mul"(i64 %t443, i64 %t444)
  store i64 %t445, ptr %local.c1.363
  %t446 = load i64, ptr %local.rng.357
  %t447 = call i64 @"lcg_next"(i64 %t446)
  store i64 %t447, ptr %local.rng.357
  %t448 = load i64, ptr %local.rng.357
  %t449 = call i64 @"lcg_f64"(i64 %t448)
  %t450 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.57)
  %t451 = call i64 @"sx_f64_sub"(i64 %t449, i64 %t450)
  %t452 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.58)
  %t453 = call i64 @"sx_f64_mul"(i64 %t451, i64 %t452)
  store i64 %t453, ptr %local.d0.364
  %t454 = load i64, ptr %local.rng.357
  %t455 = call i64 @"lcg_next"(i64 %t454)
  store i64 %t455, ptr %local.rng.357
  %t456 = load i64, ptr %local.rng.357
  %t457 = call i64 @"lcg_f64"(i64 %t456)
  %t458 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.59)
  %t459 = call i64 @"sx_f64_sub"(i64 %t457, i64 %t458)
  %t460 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.60)
  %t461 = call i64 @"sx_f64_mul"(i64 %t459, i64 %t460)
  store i64 %t461, ptr %local.d1.365
  %t462 = load i64, ptr %local.rng.357
  %t463 = call i64 @"lcg_next"(i64 %t462)
  store i64 %t463, ptr %local.rng.357
  %t464 = load i64, ptr %local.rng.357
  %t465 = call i64 @"lcg_f64"(i64 %t464)
  %t466 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.61)
  %t467 = call i64 @"sx_f64_sub"(i64 %t465, i64 %t466)
  %t468 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.62)
  %t469 = call i64 @"sx_f64_mul"(i64 %t467, i64 %t468)
  store i64 %t469, ptr %local.e0.366
  %t470 = load i64, ptr %local.rng.357
  %t471 = call i64 @"lcg_next"(i64 %t470)
  store i64 %t471, ptr %local.rng.357
  %t472 = load i64, ptr %local.rng.357
  %t473 = call i64 @"lcg_f64"(i64 %t472)
  %t474 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.63)
  %t475 = call i64 @"sx_f64_sub"(i64 %t473, i64 %t474)
  %t476 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.64)
  %t477 = call i64 @"sx_f64_mul"(i64 %t475, i64 %t476)
  store i64 %t477, ptr %local.e1.367
  %t478 = load i64, ptr %local.a0.358
  %t479 = load i64, ptr %local.b0.360
  %t480 = call i64 @"sx_f64_add"(i64 %t478, i64 %t479)
  %t481 = load i64, ptr %local.c0.362
  %t482 = call i64 @"sx_f64_add"(i64 %t480, i64 %t481)
  %t483 = load i64, ptr %local.d0.364
  %t484 = call i64 @"sx_f64_add"(i64 %t482, i64 %t483)
  %t485 = load i64, ptr %local.e0.366
  %t486 = call i64 @"sx_f64_add"(i64 %t484, i64 %t485)
  %t487 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.65)
  %t488 = call i64 @"sx_f64_div"(i64 %t486, i64 %t487)
  store i64 %t488, ptr %local.m0.368
  %t489 = load i64, ptr %local.a1.359
  %t490 = load i64, ptr %local.b1.361
  %t491 = call i64 @"sx_f64_add"(i64 %t489, i64 %t490)
  %t492 = load i64, ptr %local.c1.363
  %t493 = call i64 @"sx_f64_add"(i64 %t491, i64 %t492)
  %t494 = load i64, ptr %local.d1.365
  %t495 = call i64 @"sx_f64_add"(i64 %t493, i64 %t494)
  %t496 = load i64, ptr %local.e1.367
  %t497 = call i64 @"sx_f64_add"(i64 %t495, i64 %t496)
  %t498 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.66)
  %t499 = call i64 @"sx_f64_div"(i64 %t497, i64 %t498)
  store i64 %t499, ptr %local.m1.369
  %t500 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.67)
  %t501 = load i64, ptr %local.m0.368
  %t502 = load i64, ptr %local.a0.358
  %t503 = call i64 @"sx_f64_sub"(i64 %t501, i64 %t502)
  %t504 = call i64 @"sx_f64_mul"(i64 %t500, i64 %t503)
  store i64 %t504, ptr %local.ga0.370
  %t505 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.68)
  %t506 = load i64, ptr %local.m1.369
  %t507 = load i64, ptr %local.a1.359
  %t508 = call i64 @"sx_f64_sub"(i64 %t506, i64 %t507)
  %t509 = call i64 @"sx_f64_mul"(i64 %t505, i64 %t508)
  store i64 %t509, ptr %local.ga1.371
  %t510 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.69)
  %t511 = load i64, ptr %local.m0.368
  %t512 = load i64, ptr %local.b0.360
  %t513 = call i64 @"sx_f64_sub"(i64 %t511, i64 %t512)
  %t514 = call i64 @"sx_f64_mul"(i64 %t510, i64 %t513)
  store i64 %t514, ptr %local.gb0.372
  %t515 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.70)
  %t516 = load i64, ptr %local.m1.369
  %t517 = load i64, ptr %local.b1.361
  %t518 = call i64 @"sx_f64_sub"(i64 %t516, i64 %t517)
  %t519 = call i64 @"sx_f64_mul"(i64 %t515, i64 %t518)
  store i64 %t519, ptr %local.gb1.373
  %t520 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.71)
  %t521 = load i64, ptr %local.m0.368
  %t522 = load i64, ptr %local.c0.362
  %t523 = call i64 @"sx_f64_sub"(i64 %t521, i64 %t522)
  %t524 = call i64 @"sx_f64_mul"(i64 %t520, i64 %t523)
  store i64 %t524, ptr %local.gc0.374
  %t525 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.72)
  %t526 = load i64, ptr %local.m1.369
  %t527 = load i64, ptr %local.c1.363
  %t528 = call i64 @"sx_f64_sub"(i64 %t526, i64 %t527)
  %t529 = call i64 @"sx_f64_mul"(i64 %t525, i64 %t528)
  store i64 %t529, ptr %local.gc1.375
  %t530 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.73)
  %t531 = load i64, ptr %local.m0.368
  %t532 = load i64, ptr %local.d0.364
  %t533 = call i64 @"sx_f64_sub"(i64 %t531, i64 %t532)
  %t534 = call i64 @"sx_f64_mul"(i64 %t530, i64 %t533)
  store i64 %t534, ptr %local.gd0.376
  %t535 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.74)
  %t536 = load i64, ptr %local.m1.369
  %t537 = load i64, ptr %local.d1.365
  %t538 = call i64 @"sx_f64_sub"(i64 %t536, i64 %t537)
  %t539 = call i64 @"sx_f64_mul"(i64 %t535, i64 %t538)
  store i64 %t539, ptr %local.gd1.377
  %t540 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.75)
  %t541 = load i64, ptr %local.m0.368
  %t542 = load i64, ptr %local.e0.366
  %t543 = call i64 @"sx_f64_sub"(i64 %t541, i64 %t542)
  %t544 = call i64 @"sx_f64_mul"(i64 %t540, i64 %t543)
  store i64 %t544, ptr %local.ge0.378
  %t545 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.76)
  %t546 = load i64, ptr %local.m1.369
  %t547 = load i64, ptr %local.e1.367
  %t548 = call i64 @"sx_f64_sub"(i64 %t546, i64 %t547)
  %t549 = call i64 @"sx_f64_mul"(i64 %t545, i64 %t548)
  store i64 %t549, ptr %local.ge1.379
  %t550 = load i64, ptr %local.ga0.370
  %t551 = load i64, ptr %local.gb0.372
  %t552 = call i64 @"sx_f64_mul"(i64 %t550, i64 %t551)
  %t553 = load i64, ptr %local.ga1.371
  %t554 = load i64, ptr %local.gb1.373
  %t555 = call i64 @"sx_f64_mul"(i64 %t553, i64 %t554)
  %t556 = call i64 @"sx_f64_add"(i64 %t552, i64 %t555)
  store i64 %t556, ptr %local.c_ab.380
  %t557 = load i64, ptr %local.ga0.370
  %t558 = load i64, ptr %local.gc0.374
  %t559 = call i64 @"sx_f64_mul"(i64 %t557, i64 %t558)
  %t560 = load i64, ptr %local.ga1.371
  %t561 = load i64, ptr %local.gc1.375
  %t562 = call i64 @"sx_f64_mul"(i64 %t560, i64 %t561)
  %t563 = call i64 @"sx_f64_add"(i64 %t559, i64 %t562)
  store i64 %t563, ptr %local.c_ac.381
  %t564 = load i64, ptr %local.ga0.370
  %t565 = load i64, ptr %local.gd0.376
  %t566 = call i64 @"sx_f64_mul"(i64 %t564, i64 %t565)
  %t567 = load i64, ptr %local.ga1.371
  %t568 = load i64, ptr %local.gd1.377
  %t569 = call i64 @"sx_f64_mul"(i64 %t567, i64 %t568)
  %t570 = call i64 @"sx_f64_add"(i64 %t566, i64 %t569)
  store i64 %t570, ptr %local.c_ad.382
  %t571 = load i64, ptr %local.ga0.370
  %t572 = load i64, ptr %local.ge0.378
  %t573 = call i64 @"sx_f64_mul"(i64 %t571, i64 %t572)
  %t574 = load i64, ptr %local.ga1.371
  %t575 = load i64, ptr %local.ge1.379
  %t576 = call i64 @"sx_f64_mul"(i64 %t574, i64 %t575)
  %t577 = call i64 @"sx_f64_add"(i64 %t573, i64 %t576)
  store i64 %t577, ptr %local.c_ae.383
  %t578 = load i64, ptr %local.gb0.372
  %t579 = load i64, ptr %local.gc0.374
  %t580 = call i64 @"sx_f64_mul"(i64 %t578, i64 %t579)
  %t581 = load i64, ptr %local.gb1.373
  %t582 = load i64, ptr %local.gc1.375
  %t583 = call i64 @"sx_f64_mul"(i64 %t581, i64 %t582)
  %t584 = call i64 @"sx_f64_add"(i64 %t580, i64 %t583)
  store i64 %t584, ptr %local.c_bc.384
  %t585 = load i64, ptr %local.gb0.372
  %t586 = load i64, ptr %local.gd0.376
  %t587 = call i64 @"sx_f64_mul"(i64 %t585, i64 %t586)
  %t588 = load i64, ptr %local.gb1.373
  %t589 = load i64, ptr %local.gd1.377
  %t590 = call i64 @"sx_f64_mul"(i64 %t588, i64 %t589)
  %t591 = call i64 @"sx_f64_add"(i64 %t587, i64 %t590)
  store i64 %t591, ptr %local.c_bd.385
  %t592 = load i64, ptr %local.gb0.372
  %t593 = load i64, ptr %local.ge0.378
  %t594 = call i64 @"sx_f64_mul"(i64 %t592, i64 %t593)
  %t595 = load i64, ptr %local.gb1.373
  %t596 = load i64, ptr %local.ge1.379
  %t597 = call i64 @"sx_f64_mul"(i64 %t595, i64 %t596)
  %t598 = call i64 @"sx_f64_add"(i64 %t594, i64 %t597)
  store i64 %t598, ptr %local.c_be.386
  %t599 = load i64, ptr %local.gc0.374
  %t600 = load i64, ptr %local.gd0.376
  %t601 = call i64 @"sx_f64_mul"(i64 %t599, i64 %t600)
  %t602 = load i64, ptr %local.gc1.375
  %t603 = load i64, ptr %local.gd1.377
  %t604 = call i64 @"sx_f64_mul"(i64 %t602, i64 %t603)
  %t605 = call i64 @"sx_f64_add"(i64 %t601, i64 %t604)
  store i64 %t605, ptr %local.c_cd.387
  %t606 = load i64, ptr %local.gc0.374
  %t607 = load i64, ptr %local.ge0.378
  %t608 = call i64 @"sx_f64_mul"(i64 %t606, i64 %t607)
  %t609 = load i64, ptr %local.gc1.375
  %t610 = load i64, ptr %local.ge1.379
  %t611 = call i64 @"sx_f64_mul"(i64 %t609, i64 %t610)
  %t612 = call i64 @"sx_f64_add"(i64 %t608, i64 %t611)
  store i64 %t612, ptr %local.c_ce.388
  %t613 = load i64, ptr %local.gd0.376
  %t614 = load i64, ptr %local.ge0.378
  %t615 = call i64 @"sx_f64_mul"(i64 %t613, i64 %t614)
  %t616 = load i64, ptr %local.gd1.377
  %t617 = load i64, ptr %local.ge1.379
  %t618 = call i64 @"sx_f64_mul"(i64 %t616, i64 %t617)
  %t619 = call i64 @"sx_f64_add"(i64 %t615, i64 %t618)
  store i64 %t619, ptr %local.c_de.389
  %t620 = load i64, ptr %local.c_ab.380
  %t621 = load i64, ptr %local.c_ac.381
  %t622 = call i64 @"sx_f64_add"(i64 %t620, i64 %t621)
  %t623 = load i64, ptr %local.c_ad.382
  %t624 = call i64 @"sx_f64_add"(i64 %t622, i64 %t623)
  %t625 = load i64, ptr %local.c_ae.383
  %t626 = call i64 @"sx_f64_add"(i64 %t624, i64 %t625)
  %t627 = load i64, ptr %local.c_bc.384
  %t628 = call i64 @"sx_f64_add"(i64 %t626, i64 %t627)
  %t629 = load i64, ptr %local.c_bd.385
  %t630 = call i64 @"sx_f64_add"(i64 %t628, i64 %t629)
  %t631 = load i64, ptr %local.c_be.386
  %t632 = call i64 @"sx_f64_add"(i64 %t630, i64 %t631)
  %t633 = load i64, ptr %local.c_cd.387
  %t634 = call i64 @"sx_f64_add"(i64 %t632, i64 %t633)
  %t635 = load i64, ptr %local.c_ce.388
  %t636 = call i64 @"sx_f64_add"(i64 %t634, i64 %t635)
  %t637 = load i64, ptr %local.c_de.389
  %t638 = call i64 @"sx_f64_add"(i64 %t636, i64 %t637)
  store i64 %t638, ptr %local.cross.390
  %t639 = load i64, ptr %local.ga0.370
  %t640 = load i64, ptr %local.ga0.370
  %t641 = call i64 @"sx_f64_mul"(i64 %t639, i64 %t640)
  %t642 = load i64, ptr %local.ga1.371
  %t643 = load i64, ptr %local.ga1.371
  %t644 = call i64 @"sx_f64_mul"(i64 %t642, i64 %t643)
  %t645 = call i64 @"sx_f64_add"(i64 %t641, i64 %t644)
  store i64 %t645, ptr %local.na.391
  %t646 = load i64, ptr %local.gb0.372
  %t647 = load i64, ptr %local.gb0.372
  %t648 = call i64 @"sx_f64_mul"(i64 %t646, i64 %t647)
  %t649 = load i64, ptr %local.gb1.373
  %t650 = load i64, ptr %local.gb1.373
  %t651 = call i64 @"sx_f64_mul"(i64 %t649, i64 %t650)
  %t652 = call i64 @"sx_f64_add"(i64 %t648, i64 %t651)
  store i64 %t652, ptr %local.nb.392
  %t653 = load i64, ptr %local.gc0.374
  %t654 = load i64, ptr %local.gc0.374
  %t655 = call i64 @"sx_f64_mul"(i64 %t653, i64 %t654)
  %t656 = load i64, ptr %local.gc1.375
  %t657 = load i64, ptr %local.gc1.375
  %t658 = call i64 @"sx_f64_mul"(i64 %t656, i64 %t657)
  %t659 = call i64 @"sx_f64_add"(i64 %t655, i64 %t658)
  store i64 %t659, ptr %local.nc.393
  %t660 = load i64, ptr %local.gd0.376
  %t661 = load i64, ptr %local.gd0.376
  %t662 = call i64 @"sx_f64_mul"(i64 %t660, i64 %t661)
  %t663 = load i64, ptr %local.gd1.377
  %t664 = load i64, ptr %local.gd1.377
  %t665 = call i64 @"sx_f64_mul"(i64 %t663, i64 %t664)
  %t666 = call i64 @"sx_f64_add"(i64 %t662, i64 %t665)
  store i64 %t666, ptr %local.nd.394
  %t667 = load i64, ptr %local.ge0.378
  %t668 = load i64, ptr %local.ge0.378
  %t669 = call i64 @"sx_f64_mul"(i64 %t667, i64 %t668)
  %t670 = load i64, ptr %local.ge1.379
  %t671 = load i64, ptr %local.ge1.379
  %t672 = call i64 @"sx_f64_mul"(i64 %t670, i64 %t671)
  %t673 = call i64 @"sx_f64_add"(i64 %t669, i64 %t672)
  store i64 %t673, ptr %local.ne.395
  %t674 = load i64, ptr %local.na.391
  %t675 = load i64, ptr %local.nb.392
  %t676 = call i64 @"sx_f64_add"(i64 %t674, i64 %t675)
  %t677 = load i64, ptr %local.nc.393
  %t678 = call i64 @"sx_f64_add"(i64 %t676, i64 %t677)
  %t679 = load i64, ptr %local.nd.394
  %t680 = call i64 @"sx_f64_add"(i64 %t678, i64 %t679)
  %t681 = load i64, ptr %local.ne.395
  %t682 = call i64 @"sx_f64_add"(i64 %t680, i64 %t681)
  store i64 %t682, ptr %local.ind.396
  %t683 = load i64, ptr %local.ind.396
  %t684 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.77)
  %t685 = call i64 @"sx_f64_lt"(i64 %t683, i64 %t684)
  %t686 = icmp ne i64 %t685, 0
  br i1 %t686, label %then3, label %else3
then3:
  %t687 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.78)
  ret i64 %t687
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t688 = phi i64 [ 0, %else3_end ]
  %t689 = load i64, ptr %local.cross.390
  %t690 = load i64, ptr %local.ind.396
  %t691 = call i64 @"sx_f64_div"(i64 %t689, i64 %t690)
  ret i64 %t691
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.pass.692 = alloca i64
  %local.fail.693 = alloca i64
  %local.max_err.694 = alloca i64
  %local.rng.695 = alloca i64
  %local.test.696 = alloca i64
  %local.ir.697 = alloca i64
  %local.err.698 = alloca i64
  %local.pass5.699 = alloca i64
  %local.ir.700 = alloca i64
  %local.err.701 = alloca i64
  %t702 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.79)
  %t703 = ptrtoint ptr %t702 to i64
  %t704 = inttoptr i64 %t703 to ptr
  call void @intrinsic_println(ptr %t704)
  %t705 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.80)
  %t706 = ptrtoint ptr %t705 to i64
  %t707 = inttoptr i64 %t706 to ptr
  call void @intrinsic_println(ptr %t707)
  %t708 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.81)
  %t709 = ptrtoint ptr %t708 to i64
  %t710 = inttoptr i64 %t709 to ptr
  call void @intrinsic_println(ptr %t710)
  store i64 0, ptr %local.pass.692
  store i64 0, ptr %local.fail.693
  %t711 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.82)
  store i64 %t711, ptr %local.max_err.694
  store i64 31415, ptr %local.rng.695
  store i64 0, ptr %local.test.696
  %t712 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.83)
  %t713 = ptrtoint ptr %t712 to i64
  %t714 = inttoptr i64 %t713 to ptr
  call void @intrinsic_println(ptr %t714)
  br label %loop4
loop4:
  %t715 = load i64, ptr %local.test.696
  %t716 = icmp slt i64 %t715, 50
  %t717 = zext i1 %t716 to i64
  %t718 = icmp ne i64 %t717, 0
  br i1 %t718, label %body4, label %endloop4
body4:
  %t719 = load i64, ptr %local.rng.695
  %t720 = call i64 @"lcg_next"(i64 %t719)
  store i64 %t720, ptr %local.rng.695
  %t721 = load i64, ptr %local.rng.695
  %t722 = call i64 @"iratio_k3"(i64 %t721)
  store i64 %t722, ptr %local.ir.697
  %t723 = load i64, ptr %local.ir.697
  %t724 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.84)
  %t725 = call i64 @"sx_f64_add"(i64 %t723, i64 %t724)
  %t726 = call i64 @"abs_f64"(i64 %t725)
  store i64 %t726, ptr %local.err.698
  %t727 = load i64, ptr %local.err.698
  %t728 = load i64, ptr %local.max_err.694
  %t729 = call i64 @"sx_f64_gt"(i64 %t727, i64 %t728)
  %t730 = icmp ne i64 %t729, 0
  br i1 %t730, label %then5, label %else5
then5:
  %t731 = load i64, ptr %local.err.698
  store i64 %t731, ptr %local.max_err.694
  br label %then5_end
then5_end:
  br label %endif5
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t732 = phi i64 [ 0, %then5_end ], [ 0, %else5_end ]
  %t733 = load i64, ptr %local.err.698
  %t734 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.85)
  %t735 = call i64 @"sx_f64_lt"(i64 %t733, i64 %t734)
  %t736 = icmp ne i64 %t735, 0
  br i1 %t736, label %then6, label %else6
then6:
  %t737 = load i64, ptr %local.pass.692
  %t738 = add i64 %t737, 1
  store i64 %t738, ptr %local.pass.692
  br label %then6_end
then6_end:
  br label %endif6
else6:
  %t739 = load i64, ptr %local.fail.693
  %t740 = add i64 %t739, 1
  store i64 %t740, ptr %local.fail.693
  %t741 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.86)
  %t742 = ptrtoint ptr %t741 to i64
  %t743 = inttoptr i64 %t742 to ptr
  call void @intrinsic_print(ptr %t743)
  %t744 = load i64, ptr %local.test.696
  call void @print_i64(i64 %t744)
  %t745 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.87)
  %t746 = ptrtoint ptr %t745 to i64
  %t747 = inttoptr i64 %t746 to ptr
  call void @intrinsic_print(ptr %t747)
  %t748 = load i64, ptr %local.ir.697
  %t749 = call i64 @"print_f64"(i64 %t748)
  %t750 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.88)
  %t751 = ptrtoint ptr %t750 to i64
  %t752 = inttoptr i64 %t751 to ptr
  call void @intrinsic_println(ptr %t752)
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t753 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t754 = load i64, ptr %local.test.696
  %t755 = add i64 %t754, 1
  store i64 %t755, ptr %local.test.696
  br label %loop4
endloop4:
  %t756 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.89)
  %t757 = ptrtoint ptr %t756 to i64
  %t758 = inttoptr i64 %t757 to ptr
  call void @intrinsic_print(ptr %t758)
  %t759 = load i64, ptr %local.pass.692
  call void @print_i64(i64 %t759)
  %t760 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.90)
  %t761 = ptrtoint ptr %t760 to i64
  %t762 = inttoptr i64 %t761 to ptr
  call void @intrinsic_println(ptr %t762)
  store i64 0, ptr %local.pass5.699
  store i64 0, ptr %local.test.696
  %t763 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.91)
  %t764 = ptrtoint ptr %t763 to i64
  %t765 = inttoptr i64 %t764 to ptr
  call void @intrinsic_println(ptr %t765)
  %t766 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.92)
  %t767 = ptrtoint ptr %t766 to i64
  %t768 = inttoptr i64 %t767 to ptr
  call void @intrinsic_println(ptr %t768)
  br label %loop7
loop7:
  %t769 = load i64, ptr %local.test.696
  %t770 = icmp slt i64 %t769, 20
  %t771 = zext i1 %t770 to i64
  %t772 = icmp ne i64 %t771, 0
  br i1 %t772, label %body7, label %endloop7
body7:
  %t773 = load i64, ptr %local.rng.695
  %t774 = call i64 @"lcg_next"(i64 %t773)
  store i64 %t774, ptr %local.rng.695
  %t775 = load i64, ptr %local.rng.695
  %t776 = call i64 @"iratio_k5"(i64 %t775)
  store i64 %t776, ptr %local.ir.700
  %t777 = load i64, ptr %local.ir.700
  %t778 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.93)
  %t779 = call i64 @"sx_f64_add"(i64 %t777, i64 %t778)
  %t780 = call i64 @"abs_f64"(i64 %t779)
  store i64 %t780, ptr %local.err.701
  %t781 = load i64, ptr %local.err.701
  %t782 = load i64, ptr %local.max_err.694
  %t783 = call i64 @"sx_f64_gt"(i64 %t781, i64 %t782)
  %t784 = icmp ne i64 %t783, 0
  br i1 %t784, label %then8, label %else8
then8:
  %t785 = load i64, ptr %local.err.701
  store i64 %t785, ptr %local.max_err.694
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t786 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t787 = load i64, ptr %local.err.701
  %t788 = call i64 @f64_parse(ptr @.str.exp_iratio_proof_statistical.94)
  %t789 = call i64 @"sx_f64_lt"(i64 %t787, i64 %t788)
  %t790 = icmp ne i64 %t789, 0
  br i1 %t790, label %then9, label %else9
then9:
  %t791 = load i64, ptr %local.pass5.699
  %t792 = add i64 %t791, 1
  store i64 %t792, ptr %local.pass5.699
  %t793 = load i64, ptr %local.pass.692
  %t794 = add i64 %t793, 1
  store i64 %t794, ptr %local.pass.692
  br label %then9_end
then9_end:
  br label %endif9
else9:
  %t795 = load i64, ptr %local.fail.693
  %t796 = add i64 %t795, 1
  store i64 %t796, ptr %local.fail.693
  %t797 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.95)
  %t798 = ptrtoint ptr %t797 to i64
  %t799 = inttoptr i64 %t798 to ptr
  call void @intrinsic_print(ptr %t799)
  %t800 = load i64, ptr %local.test.696
  call void @print_i64(i64 %t800)
  %t801 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.96)
  %t802 = ptrtoint ptr %t801 to i64
  %t803 = inttoptr i64 %t802 to ptr
  call void @intrinsic_print(ptr %t803)
  %t804 = load i64, ptr %local.ir.700
  %t805 = call i64 @"print_f64"(i64 %t804)
  %t806 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.97)
  %t807 = ptrtoint ptr %t806 to i64
  %t808 = inttoptr i64 %t807 to ptr
  call void @intrinsic_println(ptr %t808)
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t809 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t810 = load i64, ptr %local.test.696
  %t811 = add i64 %t810, 1
  store i64 %t811, ptr %local.test.696
  br label %loop7
endloop7:
  %t812 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.98)
  %t813 = ptrtoint ptr %t812 to i64
  %t814 = inttoptr i64 %t813 to ptr
  call void @intrinsic_print(ptr %t814)
  %t815 = load i64, ptr %local.pass5.699
  call void @print_i64(i64 %t815)
  %t816 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.99)
  %t817 = ptrtoint ptr %t816 to i64
  %t818 = inttoptr i64 %t817 to ptr
  call void @intrinsic_println(ptr %t818)
  %t819 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.100)
  %t820 = ptrtoint ptr %t819 to i64
  %t821 = inttoptr i64 %t820 to ptr
  call void @intrinsic_println(ptr %t821)
  %t822 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.101)
  %t823 = ptrtoint ptr %t822 to i64
  %t824 = inttoptr i64 %t823 to ptr
  call void @intrinsic_print(ptr %t824)
  %t825 = load i64, ptr %local.pass.692
  call void @print_i64(i64 %t825)
  %t826 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.102)
  %t827 = ptrtoint ptr %t826 to i64
  %t828 = inttoptr i64 %t827 to ptr
  call void @intrinsic_print(ptr %t828)
  %t829 = load i64, ptr %local.max_err.694
  %t830 = call i64 @"print_f64"(i64 %t829)
  %t831 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.103)
  %t832 = ptrtoint ptr %t831 to i64
  %t833 = inttoptr i64 %t832 to ptr
  call void @intrinsic_println(ptr %t833)
  %t834 = load i64, ptr %local.fail.693
  %t835 = icmp eq i64 %t834, 0
  %t836 = zext i1 %t835 to i64
  %t837 = icmp ne i64 %t836, 0
  br i1 %t837, label %then10, label %else10
then10:
  %t838 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.104)
  %t839 = ptrtoint ptr %t838 to i64
  %t840 = inttoptr i64 %t839 to ptr
  call void @intrinsic_println(ptr %t840)
  br label %then10_end
then10_end:
  br label %endif10
else10:
  %t841 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.105)
  %t842 = ptrtoint ptr %t841 to i64
  %t843 = inttoptr i64 %t842 to ptr
  call void @intrinsic_print(ptr %t843)
  %t844 = load i64, ptr %local.fail.693
  call void @print_i64(i64 %t844)
  %t845 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof_statistical.106)
  %t846 = ptrtoint ptr %t845 to i64
  %t847 = inttoptr i64 %t846 to ptr
  call void @intrinsic_println(ptr %t847)
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t848 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t849 = load i64, ptr %local.fail.693
  ret i64 %t849
}


; String constants
@.str.exp_iratio_proof_statistical.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof_statistical.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof_statistical.2 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_iratio_proof_statistical.3 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.4 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.5 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.6 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.7 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.8 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.9 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.10 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.11 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.12 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.13 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.14 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.15 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.16 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.17 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.18 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.19 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.20 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.21 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.22 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.23 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.24 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.25 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.26 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.27 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof_statistical.28 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof_statistical.29 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof_statistical.30 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof_statistical.31 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.32 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.33 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.34 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.35 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.36 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.37 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.38 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.39 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.40 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.41 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.42 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.43 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_iratio_proof_statistical.44 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof_statistical.45 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.46 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.47 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.48 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.49 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.50 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.51 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.52 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.53 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.54 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.55 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.56 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.57 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.58 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.59 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.60 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.61 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.62 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.63 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.64 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof_statistical.65 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_iratio_proof_statistical.66 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_iratio_proof_statistical.67 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.68 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.69 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.70 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.71 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.72 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.73 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.74 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.75 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.76 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof_statistical.77 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_iratio_proof_statistical.78 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof_statistical.79 = private unnamed_addr constant [48 x i8] c"=== PROOF 3 (FIXED): Statistical Validation ===\00"
@.str.exp_iratio_proof_statistical.80 = private unnamed_addr constant [60 x i8] c"  50 random K=3 problems (4D) + 20 random K=5 problems (2D)\00"
@.str.exp_iratio_proof_statistical.81 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof_statistical.82 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof_statistical.83 = private unnamed_addr constant [22 x i8] c"  K=3, 4D (50 tests):\00"
@.str.exp_iratio_proof_statistical.84 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.85 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_iratio_proof_statistical.86 = private unnamed_addr constant [13 x i8] c"  FAIL test \00"
@.str.exp_iratio_proof_statistical.87 = private unnamed_addr constant [5 x i8] c": I=\00"
@.str.exp_iratio_proof_statistical.88 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof_statistical.89 = private unnamed_addr constant [15 x i8] c"  K=3 passed: \00"
@.str.exp_iratio_proof_statistical.90 = private unnamed_addr constant [4 x i8] c"/50\00"
@.str.exp_iratio_proof_statistical.91 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof_statistical.92 = private unnamed_addr constant [22 x i8] c"  K=5, 2D (20 tests):\00"
@.str.exp_iratio_proof_statistical.93 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof_statistical.94 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_iratio_proof_statistical.95 = private unnamed_addr constant [13 x i8] c"  FAIL test \00"
@.str.exp_iratio_proof_statistical.96 = private unnamed_addr constant [5 x i8] c": I=\00"
@.str.exp_iratio_proof_statistical.97 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof_statistical.98 = private unnamed_addr constant [15 x i8] c"  K=5 passed: \00"
@.str.exp_iratio_proof_statistical.99 = private unnamed_addr constant [4 x i8] c"/20\00"
@.str.exp_iratio_proof_statistical.100 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof_statistical.101 = private unnamed_addr constant [10 x i8] c"  TOTAL: \00"
@.str.exp_iratio_proof_statistical.102 = private unnamed_addr constant [27 x i8] c"/70 passed, max |I+0.5| = \00"
@.str.exp_iratio_proof_statistical.103 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof_statistical.104 = private unnamed_addr constant [46 x i8] c"  PROVEN: I = -0.5 for ALL 70 random problems\00"
@.str.exp_iratio_proof_statistical.105 = private unnamed_addr constant [11 x i8] c"  FAILED: \00"
@.str.exp_iratio_proof_statistical.106 = private unnamed_addr constant [1 x i8] c"\00"
